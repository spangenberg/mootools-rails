module Mootools
  module Rails
    class Railtie < ::Rails::Railtie

      config.before_configuration do
        require "mootools-rails/assert_select_mootools" if ::Rails.env.test?

        jq_defaults = ::Rails.env.production? ? %w(mootools.min) : %w(mootools)

        config.action_view.javascript_expansions[:defaults] = jq_defaults + %w(rails)
      end

    end
  end
end