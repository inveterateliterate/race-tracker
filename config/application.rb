require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RaceTracker
  class Application < Rails::Application
    app_folders = %w[].map { |f| "app/#{f}" }
    root_folders = %w[lib]

    folders = (app_folders + root_folders).map { |f| "#{config.root}/#{f}/**/" }
    config.autoload_paths   += Dir["#{config.root}/app/models/**/", "#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/app/models/**/", "#{config.root}/lib/**/"]
    config.autoload_paths += Dir[*folders]

    config.generators do |g|
      g.test_framework  :rspec,
                        fixtures: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: true,
                        request_specs: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    # Set Host
    config.action_mailer.default_url_options = { host: ENV['APPLICATION_ROOT_URL'] }
    config.after_initialize do
      Rails.application.routes.default_url_options[:host] = ENV['APPLICATION_ROOT_URL']
    end

    # config.assets.precompile += %w( email.css )

    root_url = Rails.env.staging? ? "#{ENV['HEROKU_APP_NAME']}.herokuapp.com" : ENV['APPLICATION_ROOT_URL']

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: root_url }

    config.action_mailer.smtp_settings = {
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      domain: root_url,
      address: 'smtp.sendgrid.net',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }

    config.action_mailer.preview_path = "#{Rails.root}/lib/mailer_previews"

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
