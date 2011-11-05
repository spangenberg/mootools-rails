# Configure Rails 3.0 to use public/javascripts/mootools et al
module Mootools
  module Rails

    class Railtie < ::Rails::Railtie
      config.before_configuration do
        require "mootools/assert_select" if ::Rails.env.test?

        if ::Rails.root.join("public/javascripts/mootools-more.min.js").exist?
          jq_defaults = %w(mootools mootools-more)
          jq_defaults.map!{|a| a + ".min" } if ::Rails.env.production?
        else
          jq_defaults = ::Rails.env.production? ? %w(mootools.min) : %w(mootools)
        end

        # Merge the MooTools scripts, remove the Prototype defaults and finally add 'mootools_ujs'
        # at the end, because load order is important
        config.action_view.javascript_expansions[:defaults] -= PROTOTYPE_JS + ['rails']
        config.action_view.javascript_expansions[:defaults] |= jq_defaults
        config.action_view.javascript_expansions[:defaults] << 'mootools_ujs'
      end
    end

  end
end
