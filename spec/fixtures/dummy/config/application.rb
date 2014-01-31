require "action_controller/railtie"

# Load Staccato Rails
require File.expand_path('../../../../../lib/staccato-rails', __FILE__)

module Dummy
  class Application < Rails::Application
    # set our root to the non-default spec/fixtures/dummy path
    config.root = File.expand_path('../../', __FILE__)

    # Disable the asset pipeline.
    config.assets.enabled = false

    config.autoload_paths << File.join(config.root, "app/views")
  end
end

Dummy::Application.initialize!