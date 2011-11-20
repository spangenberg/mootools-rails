require 'rails'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
  module Mootools
    module Generators
      class InstallGenerator < ::Rails::Generators::Base

        desc "This generator installs MooTools #{Mootools::Rails::MOOTOOLS_VERSION}, MooTools-ujs, and (optionally) MooTools More #{Mootools::Rails::MOOTOOLS_MORE_VERSION}"
        class_option :more, :type => :boolean, :default => false, :desc => "Include MooTools More"
        source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

        def remove_prototype
          Rails::PROTOTYPE_JS.each do |name|
            remove_file "public/javascripts/#{name}.js"
          end
        end

        def copy_mootools
          say_status("copying", "MooTools (#{Mootools::Rails::MOOTOOLS_VERSION})", :green)
          copy_file "mootools.js", "public/javascripts/mootools.js"
          copy_file "mootools.min.js", "public/javascripts/mootools.min.js"
        end

        def copy_mootools_more
          if options.ui?
            say_status("copying", "MooTools More (#{Mootools::Rails::MOOTOOLS_MORE_VERSION})", :green)
            copy_file "mootools-more.js", "public/javascripts/mootools-more.js"
            copy_file "mootools-mootools.min.js", "public/javascripts/mootools-more.min.js"
          end
        end

        def copy_ujs_driver
          say_status("copying", "MooTools UJS adapter (#{Mootools::Rails::MOOTOOLS_UJS_VERSION[0..5]})", :green)
          remove_file "public/javascripts/rails.js"
          copy_file "mootools_ujs.js", "public/javascripts/mootools_ujs.js"
        end

      end
    end
  end
else
  module Mootools
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Just show instructions so people will know what to do when mistakenly using generator for Rails 3.1 apps"

        def do_nothing
          say_status("deprecated", "You are using Rails 3.1 with the asset pipeline enabled, so this generator is not needed.")
          say_status("", "The necessary files are already in your asset pipeline.")
          say_status("", "Just add `//= require mootools` and `//= require mootools_ujs` to your app/assets/javascripts/application.js")
          say_status("", "If you upgraded your app from Rails 3.0 and still have mootools.js, rails.js, or mootools_ujs.js in your javascripts, be sure to remove them.")
          say_status("", "If you do not want the asset pipeline enabled, you may turn it off in application.rb and re-run this generator.")
          # ok, nothing
        end
      end
    end
  end
end
