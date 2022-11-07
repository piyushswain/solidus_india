# frozen_string_literal: true

namespace :db do
  namespace :seed do
    desc 'Loads solidus_india sample data'
    task solidus_india: :environment do
      Dir[File.join(SolidusIndia::Engine.root, 'db', 'samples*', '*.rb')].each do |seed|
        puts "Seeding #{seed}..."
        load seed
      end
    end
  end
end
