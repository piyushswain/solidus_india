# frozen_string_literal: true

tax_category = Spree::TaxCategory.find_by(name: 'IGST')

if tax_category.present?
  Spree::Product.all.each do |product|
    product.update(tax_category: tax_category)
  end
else
  Rails.logger 'IGST TaxCategory not found, update the products manually after ensuring the TaxCategory has been created'
end
