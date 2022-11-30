# frozen_string_literal: true

require_dependency 'spree/calculator'

module SolidusIndia
  class IgstCalculator < Spree::Calculator
    def compute_line_item(line_item)
      calculate_rates(line_item)
    end

    def compute_shipment(shipment)
      calculate_rates(shipment)
    end

    def compute_shipping_rate(shipping)
      calculate_rates(shipping)
    end

    private

    def calculate_rates(item)
      tax_rate = Spree::TaxRate.find_by(name: 'IGST')
      item.amount * tax_rate.amount
    end
  end
end
