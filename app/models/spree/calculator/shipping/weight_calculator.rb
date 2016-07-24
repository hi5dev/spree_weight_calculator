# Calculates shipping based on the package's total weight, including handling
# fees.
class Spree::Calculator::Shipping::WeightCalculator < Spree::ShippingCalculator
  # comma separated list of shipping costs
  preference :costs, :string

  # comma separated list of handling fees
  preference :handling_fees, :string

  # comma separated list of package weights
  preference :weights, :string

  # Description of the shipping method provided to the back-end of Spree.
  #
  # @return [String] A single-line description.
  def self.description
    Spree.t('shipping_weight_calculator_description')
  end

  # Calculates how much it will cost to ship the package.
  #
  # @param [Spree::Stock::Package] package The package being shipped.
  # @return [Fixnum] Total cost, including handling fees, to ship the package.
  def compute_package(package)
    # convert the preferences to arrays of Fixnum values
    costs = string_to_fixnum_array(preferred_costs)
    handling_fees = string_to_fixnum_array(preferred_handling_fees)
    weights = string_to_fixnum_array(preferred_weights)

    # get the index of the weight group the package belongs in
    index = weight_index(package.weight.to_f, weights)

    # return the package's shipping cost + handling fee
    costs[index] + handling_fees[index]
  end

  private

  # Converts a String into an Array of Fixnums.
  #
  # @param [String] string The string to convert.
  # @return [Array] List of Fixnum values.
  def string_to_fixnum_array(string)
    string.split(',').map {|value| value.strip.to_f }
  end

  # Finds the index of the group the weight belongs to.
  #
  # @param [Fixnum] package_weight The weight of the package.
  # @param [Array] weight_groups List of weight groups as Fixnums.
  # @return [Integer] Index of the weight group from #preferred_weights.
  def weight_index(package_weight, weight_groups)
    # find the heaviest weight group for the package
    weight_group = weight_groups.select {|w| package_weight <= w }.min

    # put overweight packages in the last group
    weight_group ||= weight_groups.max

    # return the index of the weight group
    weight_groups.index(weight_group)
  end
end
