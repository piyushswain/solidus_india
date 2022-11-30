# frozen_string_literal: true

country = Spree::Country.find_by(iso: 'IN')

zone = Spree::Zone.find_or_create_by!(
  name: 'India',
  description: 'Taxes applied in the Indian Region',
)

Spree::ZoneMember.find_or_create_by!(
  zoneable_type: 'Spree::Country',
  zoneable_id: country.id,
  zone_id: zone.id
)

tax_category_igst = Spree::TaxCategory.find_or_create_by!(
  name: 'IGST',
  description: 'Integrated Goods and Services Taxes',
  tax_code: 'igst'
)

if tax_category_igst.tax_rates.pluck(:name).exclude?('IGST')
  tax_rate_igst = Spree::TaxRate.find_or_create_by!(
    name: 'IGST',
    zone_id: zone.id,
    amount: 0.18,
    included_in_price: false,
    show_rate_in_label: true,
    level: 'item',
    calculator: SolidusIndia::IgstCalculator.new
  )

  Spree::TaxRateTaxCategory.find_or_create_by!(
    tax_rate_id: tax_rate_igst.id,
    tax_category_id: tax_category_igst.id
  )
end

tax_category_gst = Spree::TaxCategory.find_or_create_by!(
  name: 'CGST + SGST',
  description: 'Central and State Goods and Services Taxes',
  tax_code: 'cgst-sgst'
)

if tax_category_gst.tax_rates.pluck(:name).exclude?('CGST')
  tax_rate_cgst = Spree::TaxRate.find_or_create_by!(
    name: 'CGST',
    zone_id: zone.id,
    amount: 0.09,
    included_in_price: false,
    show_rate_in_label: true,
    level: "item",
    calculator: SolidusIndia::CgstCalculator.new
  )

  Spree::TaxRateTaxCategory.find_or_create_by!(
    tax_rate_id: tax_rate_cgst.id,
    tax_category_id: tax_category_gst.id
  )
end

if tax_category_gst.tax_rates.pluck(:name).exclude?('SGST')
  tax_rate_sgst = Spree::TaxRate.find_or_create_by!(
    name: 'SGST',
    zone_id: zone.id,
    amount: 0.09,
    included_in_price: false,
    show_rate_in_label: true,
    level: "item",
    calculator: SolidusIndia::SgstCalculator.new
  )

  Spree::TaxRateTaxCategory.find_or_create_by!(
    tax_rate_id: tax_rate_sgst.id,
    tax_category_id: tax_category_gst.id
  )
end
