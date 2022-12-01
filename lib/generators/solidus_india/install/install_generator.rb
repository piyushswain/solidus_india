# frozen_string_literal: true

module SolidusIndia
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def run_seeds
        puts 'Starting to add seeds from Solidus India'
        run 'bin/rails db:seed:solidus_india'
        puts 'Finished seeding successfully'
      end
    end
  end
end
