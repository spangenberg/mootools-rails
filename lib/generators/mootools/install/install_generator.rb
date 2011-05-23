require 'rails'

module Mootools
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      @@mootools_version      = "1.3.2"
      @@mootools_more_version = '1.3.2.1'
      @@mootools_ujs_version  = "2c1e98715bc0fc74afa3c79e5d125e55450ba74a"

      desc "This generator installs MooTools #{@@mootools_version}, MooTools-ujs, and (optionally) MooTools More #{@@mootools_more_version}"
      class_option :more, :type => :boolean, :default => false, :desc => "Include MooTools More"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def remove_prototype
        PROTOTYPE_JS.each do |name|
          remove_file "public/javascripts/#{name}.js"
        end
      end

      def copy_mootools
        say_status("copying", "MooTools (#{@@mootools_version})", :green)
        copy_file "mootools.js", "public/javascripts/mootools.js"
        copy_file "mootools.min.js", "public/javascripts/mootools.min.js"
      end

      def copy_mootools_more
        if options.more?
          say_status("copying", "MooTools More (#{@@mootools_more_version})", :green)
          copy_file "mootools-more.js", "public/javascripts/mootools-more.js"
          copy_file "mootools-more.min.js", "public/javascripts/mootools-more.min.js"
        end
      end

      def copy_ujs_driver
        say_status("copying", "MooTools UJS adapter (#{@@mootools_ujs_version[0..5]})", :green)
        remove_file "public/javascripts/rails.js"
        copy_file "mootools_ujs.js", "public/javascripts/mootools_ujs.js"
      end

    end
  end
end if ::Rails.version < "3.1"
