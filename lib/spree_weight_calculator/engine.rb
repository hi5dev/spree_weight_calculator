module SpreeWeightCalculator
  class Engine < ::Rails::Engine
    isolate_namespace Spree

    engine_name 'spree_weight_calculator'

    initializer 'spree.register.calculators.simple_weight', after: 'spree.register.calculators' do |app|
      app.config.spree.calculators.shipping_methods += [
        Spree::Calculator::Shipping::WeightCalculator
      ]
    end
  end
end
