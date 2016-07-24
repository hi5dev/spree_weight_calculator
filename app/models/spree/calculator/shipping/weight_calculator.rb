class Spree::Calculator::Shipping::WeightCalculator < Spree::ShippingCalculator
  preference :rules, :array
  preference :default_weight, :decimal, default: 1
  preference :handing_fee, :decimal, default: 0

  def self.description
    Spree.t(':shipping_weight_calculator_description')
  end

  def compute_package(package)
    weight = calculate_package_weight(package)

    0
  end

  private

  # Gets the total weight of the given package.
  #
  # @param [Object] package The package that is being shipped.
  # @return [Fixnum] The package's total shipping weight.
  def calculate_package_weight(package)
    package.contents.inject(0) do |weight, item|
      weight + (item.quantity * item.weight)
    end
  end
end
