# MooTools-rails

## Rails 3.1

This gem vendors MooTools 1.3.2 and the latest MooTools UJS adapter for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use. These two lines will be added to the file `app/assets/javascripts/application.js` by default:

    //= require mootools
    //= require mootools_ujs

If you wish to use MooTools More as well, you can add this line to `application.js`:

    //= require mootools-more

### Installation

When you generate a new Rails 3.1 app, pass the `-j mootools` option, like this:

    rails new myapp -j mootools

Then run `bundle install`. You're done!

## Rails 3.0

This gem adds a single generator to Rails 3, mootools:install. Running the generator will remove any Prototype JS files you may happen to have, fetch MooTools and the MooTools UJS driver for Rails, and (optionally) fetch MooTools More.

The gem will also hook into the Rails configuration process, removing Prototype and adding MooTools to the javascript files included by the `javascript_include_tag(:defaults)` call. While the plugin downloads minified and un-minified versions of MooTools and MooTools More, only the minified versions are included in :default.

### Installation

In your Gemfile, add this line:

    gem 'mootools-rails'

Then, run `bundle install`. To invoke the generator, run:

    rails generate mootools:install #--more to enable MooTools More

You're done!
