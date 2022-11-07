Spree::Variant.all.each do |variant|
  variant.cost_currency = 'INR'
  variant.price = variant.price * 10
  variant.save!
end
