module Mootools
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs MooTools, MooTools-ujs HEAD"
      class_option :version, :type => :string, :default => "1.2.5", :desc => "Which version of MooTools to fetch"
      @@versions = %w( 1.2.5 1.2.4 1.2.3 1.2.2 1.2.1 1.1.2 1.1.1 )

      def remove_prototype
        %w(controls.js dragdrop.js effects.js prototype.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
      end

      def download_mootools
        # Downloading latest MooTools
        if @@versions.include?(options.version)
          puts "Fetching MooTools version #{options.version}!"
          get "http://ajax.googleapis.com/ajax/libs/mootools/#{options.version}/mootools-yui-compressed.js", "public/javascripts/mootools.min.js"
          get "http://ajax.googleapis.com/ajax/libs/mootools/#{options.version}/mootools.js", "public/javascripts/mootools.js"
        else
          puts "MooTools #{options.version} is invalid; fetching #{@@versions[1]} instead."
          get "http://ajax.googleapis.com/ajax/libs/mootools/#{@@versions[1]}/mootools-yui-compressed.js", "public/javascripts/mootools.min.js"
          get "http://ajax.googleapis.com/ajax/libs/mootools/#{@@versions[1]}/mootools.js", "public/javascripts/mootools.js"
        end
      end

      def download_ujs_driver
        # Downloading latest MooTOols drivers
        get "http://github.com/neonlex/mootools-ujs/raw/master/Source/rails.js", "public/javascripts/rails.js"
      end
    end
  end
end