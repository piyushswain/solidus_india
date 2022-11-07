# frozen_string_literal: true

Spree::Product.all.each do |product|
  Spree::Price.create!(
    currency: 'INR',
    amount: product.master.cost_price * 10,
    variant_id: product.master.id
  )
end
