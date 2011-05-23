module Mootools
  
  PROTOTYPE_JS = %w{prototype effects dragdrop controls}
  
  module Rails
    
    class Railtie < ::Rails::Railtie
      config..before_configuration do
        if ::Rails.root.join('public/javascripts/mootools-more.min.js').exist?
          mootools_defaults = %w(mootools mootools-more)
          mootools_defaults.map!{|a| a + '.min'} if ::Rails.env.production?
        else
          mootools_defaults = ::Rails.env.production?? %w(mootools.min) : %w(mootools)
        end
        
        config.action_view.javascript_expansion[:defaults] -= PROTOTYPE_JS + %w(rails)
        config.action_view.javascript_expansion[:defaults] |= mootools_defaults
        config.action_view.javascript_expansion[:defaults] << 'mootools_ujs'
      end
    end
    
  end if ::Rails.version < '3.1'
end 