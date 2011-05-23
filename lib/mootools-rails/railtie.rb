module Mootools
  module Rails

    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if ::Rails.root.join('public/javascripts/mootools-more.min.js').exist?
          mootools_defaults = %w(mootools mootools-more)
          mootools_defaults.map!{|a| a + '.min' } if ::Rails.env.production?
        else
          mootools_defaults = ::Rails.env.production? ? %w(mootools.min) : %w(mootools)
        end

        # Merge the MooTools scripts, remove the Prototype defaults and finally add 'rails'
        # at the end, because load order is important
        config.action_view.javascript_expansions[:defaults] -= PROTOTYPE_JS + %w(rails)
        config.action_view.javascript_expansions[:defaults] |= mootools_defaults
        config.action_view.javascript_expansions[:defaults] << 'mootools_ujs'
      end
    end

  end
end
