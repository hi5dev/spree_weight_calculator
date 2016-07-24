# Spree Weight Calculator

A plugin for Spree that calculates shipping based on the weight of the package.

## Compatibility

This plugin should be compatible with Spree version 3.1 or higher. It is not
locked in to a specific version like most Spree plugins, so you can install it
in your application as long as you have Spree 3.1 or higher. It has only been
tested on version 3.1.0. It's up to you to make sure it works on your app's
version.

## Installing

Add the following line to your Gemfile:

```ruby
gem 'spree_weight_calculator'
```

and run `bundle` to install.

## Using

Create a shipping method in Spree, and select the weight based calculator.
After you save the shipping method, you will have 3 preferences: costs,
handling fees, and weights. Each preference is a comma-separated list of
numbers.

Let's program the shipping weight for the following rules:

* Packages that weigh up to 20 cost $10 to ship with a handling fee of $7.
* Packages that weigh >20 to 30 cost $25 to ship with a handling fee of $10.
* Packages that weigh more than 50 cost $50 to ship with a handling fee of $15.

For the above rules, set the preferences to:

    costs: "10,15,50"
    handling_fees: "7,10,15"
    weights: "20,30,50"
