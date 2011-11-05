# Configure Rails 3.1 to have assert_select_mootools() in tests
module Mootools
  module Rails

    class Engine < ::Rails::Engine
      config.before_configuration do
        require "mootools/assert_select" if ::Rails.env.test?
      end
    end

  end
end
