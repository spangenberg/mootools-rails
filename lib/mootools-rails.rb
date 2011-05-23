module Mootools
  PROTOTYPE_JS = %w{prototype effects dragdrop controls}

  module Rails
    if ::Rails.version < "3.1"
      require 'mootools-rails/railtie'
    else
      require 'mootools-rails/engine'
    end
  end

end
