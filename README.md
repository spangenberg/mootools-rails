# Mootools-rails

This gem adds a single generator to Rails 3, mootools:install. Running the generator will remove any Prototype JS files you may happen to have, fetch MooTools Core and the MooTools-ujs driver for Rails.

The gem will also hook into the Rails configuration process, removing Prototype and adding MooTools to the javascript files included by the `javascript_include_tag(:defaults)` call. While the plugin downloads minified and un-minified version of MooTools, only the minified versions are included in :default.

### Installation

In your Gemfile, add this line:

    gem "mootools-rails"

Then, run `bundle install`. To invoke the generator, run:

    rails generate mootools:install --version to install specific version of MooTools (default is 1.2.5)

You're done! Don't forget to output `csrf_meta_tag` somewhere inside your `<head>` tag in your layout!
