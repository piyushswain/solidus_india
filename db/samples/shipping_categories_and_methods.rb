# frozen_string_literal: true

india = Spree::Zone.find_by!(name: 'India')
tax_category = Spree::TaxCategory.find_by!(name: 'IGST')
shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'India')

Spree::ShippingMethod.create!([
  {
    name: 'Free Shipping (INR)',
    zones: [india],
    calculator: Spree::Calculator::Shipping::FlatRate.create!,
    tax_category: tax_category,
    shipping_categories: [shipping_category]
  },
  {
    name: 'Express Shipping (INR)',
    zones: [india],
    calculator: Spree::Calculator::Shipping::FlatRate.create!,
    tax_category: tax_category,
    shipping_categories: [shipping_category]
  }
])

{
  'Free Shipping (INR)' => [0, 'INR'],
  'Express Shipping (INR)' => [100, 'INR']
}.each do |shipping_method_name, (price, currency)|
  shipping_method = Spree::ShippingMethod.find_by!(name: shipping_method_name)
  shipping_method.calculator.preferences = {
    amount: price,
    currency: currency
  }
  shipping_method.calculator.save!
  shipping_method.save!
end
