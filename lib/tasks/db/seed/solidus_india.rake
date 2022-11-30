# frozen_string_literal: true

namespace :db do
  namespace :seed do
    desc 'Loads solidus_india sample data'
    task solidus_india: :environment do
      samples_root = File.join(SolidusIndia::Engine.root, 'db', 'samples')

      puts 'load prices_inr'
      load File.join(samples_root, 'prices_inr.rb')
      puts 'load variants_inr'
      load File.join(samples_root, 'variants_inr.rb')
      puts 'load tax_rates_and_zone'
      load File.join(samples_root, 'tax_rates_and_zone.rb')
      puts 'load shipping_categories_and_methods'
      load File.join(samples_root, 'shipping_categories_and_methods.rb')
      puts 'load update_products_with_tax_category'
      load File.join(samples_root, 'update_products_with_tax_category.rb')
    end
  end
end
