module Mootools
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs MooTools and MooTools-ujs HEAD"
      class_option :version, :type => :string, :default => "1.2.5", :desc => "Which version of MooTools to fetch"
      @@default_version = "1.2.5"

      def remove_prototype
        %w(controls.js dragdrop.js effects.js prototype.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
      end

      def download_mootools
        say_status("fetching", "MooTools (#{options.version})", :green)
        get_mootools(options.version)
      rescue OpenURI::HTTPError
        say_status("warning", "could not find MooTools (#{options.version})", :yellow)
        say_status("fetching", "MooTools (#{@@default_version})", :green)
        get_mootools(@@default_version)
      end

      def download_ujs_driver
        say_status("fetching", "MooTools UJS adapter (github HEAD)", :green)
        get "http://github.com/neonlex/mootools-ujs/raw/master/Source/rails.js", "public/javascripts/rails.js"
      end

    private

      def get_mootools(version)
        get "http://ajax.googleapis.com/ajax/libs/mootools/#{version}/mootools.js",                "public/javascripts/mootools.js"
        get "http://ajax.googleapis.com/ajax/libs/mootools/#{version}/mootools-yui-compressed.js", "public/javascripts/mootools.min.js"
      end

    end
  end
end