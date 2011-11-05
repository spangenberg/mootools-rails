module Mootools
  module Rails
    PROTOTYPE_JS = %w{prototype effects dragdrop controls}

    if ::Rails.version < "3.1"
      require 'mootools/rails/railtie'
    else
      require 'mootools/rails/engine'
    end
    require 'mootools/rails/version'
  end
end
