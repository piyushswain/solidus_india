# frozen_string_literal: true

Spree::Variant.all.each do |variant|
  next if variant.cost_currency == 'INR'

  variant.cost_currency = 'INR'
  variant.price = variant.cost_price * 10
  variant.save!
end
