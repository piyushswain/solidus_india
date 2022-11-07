# frozen_string_literal: true

Spree::Variant.all.each do |variant|
  variant.cost_currency = 'INR'
  variant.price = variant.cost_price * 10
  variant.save!
end
