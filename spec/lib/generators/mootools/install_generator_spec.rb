require 'spec/test/unit'
require 'spec_helper'
require 'generators/mootools/install/install_generator'

class Mootools::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  describe "The MooTools generator"

  destination File.join(Rails.root)
  tests Mootools::Generators::InstallGenerator
  arguments []

  setup :prepare_destination

  it "should install mootools" do
    run_generator

    %w(mootools.min.js mootools.js rails.js).each { |js| assert_file "public/javascripts/#{js}" }
    %w(controls.js dragdrop.js effects.js prototype.js).each { |js| assert_no_file "public/javascripts/#{js}" }
  end
end
