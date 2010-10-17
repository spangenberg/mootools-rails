require 'spec/test/unit'
require 'spec_helper'
require 'generators/jquery/install/install_generator'

class Mootools::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  describe "The MooTools generator"

  destination File.join(Rails.root)
  tests Mootools::Generators::InstallGenerator
  arguments []

  before(:each) do
    prepare_destination
    @response = {:body => "abc", :status => 200}
    stub_request(:get, /ajax.googleapis.com|github.com/).to_return(@response)
  end

  it "should remove prototype" do
    run_generator
    %w(controls.js dragdrop.js effects.js prototype.js).each { |js| assert_no_file "public/javascripts/#{js}" }
  end

  it "should install the rails ujs shim" do
    run_generator
    assert_file "public/javascripts/rails.js"
  end

  it "should install mootools" do
    run_generator
    %w(mootools.min.js mootools.js).each { |js| assert_file "public/javascripts/#{js}" }
  end

  it "should install old mootools versions" do
    run_generator %w(--version 1.2.4)
    %w(mootools.min.js mootools.js).each { |js| assert_file "public/javascripts/#{js}" }
  end

  it "should try to install unknown mootools versions with fallback" do
    stub_request(:get, /ajax.googleapis.com/).
      to_return(:status => 404, :body => "No").
      to_return(@response)
    run_generator %w(--version 100.0)
    %w(mootools.min.js mootools.js).each { |js| assert_file "public/javascripts/#{js}" }
  end
end