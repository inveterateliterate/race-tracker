require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RaceTracker
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    app_folders = %w(models services).map {|f| "app/#{f}"}
    root_folders = %w()

    folders = (app_folders + root_folders).map {|f| "#{config.root}/#{f}/**/"}
    config.autoload_paths += Dir[*folders]
    Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| require l }
  end
end
