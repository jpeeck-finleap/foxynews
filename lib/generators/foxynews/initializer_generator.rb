module Foxynews
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "This generator creates the foxynews initializer file at config/initializers"
      def create_initializer_file
        copy_file "foxynews_template.rb", "config/initializers/foxynews.rb"
      end
    end
  end
end
