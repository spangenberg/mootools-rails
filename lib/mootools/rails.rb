require 'mootools/assert_select' if ::Rails.env.test?
require 'mootools/rails/engine' if ::Rails.version >= '3.1'
require 'mootools/rails/railtie'
require 'mootools/rails/version'

module Mootools
  module Rails
    PROTOTYPE_JS = %w{prototype effects dragdrop controls}
  end
end
