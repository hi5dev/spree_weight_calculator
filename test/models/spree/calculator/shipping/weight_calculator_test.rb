require 'test_helper'

module Spree::Calculator::Shipping
  class WeightCalculatorTest < ActiveSupport::TestCase
    include FactoryGirl::Syntax::Methods

    test 'shipping can be calculated based on package weight' do
      calculator = WeightCalculator.new(
        preferred_costs: '10, 20, 30.00',
        preferred_handling_fees: '0, 5, 15',
        preferred_weights: '5, 10, 20'
      )

      assert_equal 10, calculator.compute(package(1))
      assert_equal 10, calculator.compute(package(5))
      assert_equal 25, calculator.compute(package(5.1))
      assert_equal 25, calculator.compute(package(10))
      assert_equal 45, calculator.compute(package(11))
      assert_equal 45, calculator.compute(package(19))
      assert_equal 45, calculator.compute(package(30))
    end

    private

    # Builds a package that weighs the given amount.
    #
    # @param [Fixnum] weight How much the package should weigh.
    # @return [Spree::Stock::Package] A package with the given weight.
    def package(weight)
      variant = build(:variant, weight: weight)

      build :stock_package, variants_contents: {variant => 1}
    end
  end
end
