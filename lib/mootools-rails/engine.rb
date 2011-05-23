# Configure Rails 3.1 to have assert_select_mootools
module Mootools
  module Rails

    class Engine < ::Rails::Engine
      config.before_configuration do
        require "mootools-rails/assert_select_mootools" if ::Rails.env.test?
      end
    end

  end
end
