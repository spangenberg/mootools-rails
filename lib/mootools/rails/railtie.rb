# Used to ensure that Rails 3.0.x, as well as Rails >= 3.1 with asset pipeline disabled
# get the minified version of the scripts included into the layout in production.
module Mootools
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if config.action_view.javascript_expansions
          if ::Rails.root.join('public/javascripts/mootools-more.min.js').exist?
            jq_defaults = %w(mootools mootools-more)
            jq_defaults.map! { |name| "#{name}.min" } if ::Rails.env.production? || ::Rails.env.test?
          else
            jq_defaults = ::Rails.env.production? || ::Rails.env.test? ? %w(mootools.min.min) : %w(mootools)
          end

          # Merge the MooTools scripts, remove the Prototype defaults and finally add 'mootools_ujs'
          # at the end, because load order is important
          config.action_view.javascript_expansions[:defaults] -= PROTOTYPE_JS + ['rails']
          config.action_view.javascript_expansions[:defaults] |= jq_defaults + ['mootools_ujs']
        end
      end
    end
  end
end
