# mootools-rails

MooTools! For Rails! So great.

This gem provides:

  * MooTools 1.5.0
  * MooTools More 1.5.0
  * the MooTools UJS adapter
  * assert_select_mootools to test MooTools responses in Ruby tests

## Installation

Apps generated with Rails 3.1 or later include jquery-rails in the
Gemfile by default. To use MooTools instead, you have to pass the `-j
mootools` option. So just make a new app:

```sh
rails new myapp -j mootools
```

If upgrading from an older version of rails, or for rails 3.0 apps,
add the mootools-rails gem to your Gemfile.

```ruby
gem 'mootools-rails'
```

And run `bundle install`. The rest of the installation depends on
whether the asset pipeline is being used.

### Rails 3.1 or greater (with asset pipeline *enabled*)

The mootools and mootools-ujs files will be added to the asset pipeline and available for you to use. If they're not already in `app/assets/javascripts/application.js` by default, add these lines:

```js
//= require mootools
//= require mootools_ujs
```

If you wish to use MooTools More as well, you can add this line to
`app/assets/javascripts/application.js`:

```js
//= require mootools-more
```

### Rails 3.0 (or greater with asset pipeline *disabled*)

This gem adds a single generator: `mootools:install`. Running the
generator will remove any Prototype JS files you may happen to have, and
copy MooTools and the MooTools-ujs driver for Rails (and optionally,
MooTools More) to the `public/javascripts` directory.

This gem will also hook into the Rails configuration process, removing
Prototype and adding MooTools to the javascript files included by the
`javascript_include_tag(:defaults)` call. While this gem contains the
minified and un-minified versions of MooTools and MooTools More, only the minified versions will be included in the `:defaults` when Rails is run in `production` or `test` mode  (un-minified versions will be included when Rails is run in `development` mode).

To invoke the generator, run:

```sh
rails generate mootools:install #--more to enable MooTools More
```

You're done!

## Contributing

Feel free to open an issue ticket if you find something that could be improved. A couple notes:

* If it's an issue pertaining to the mootools-ujs javascript, please
  report it to the [mootools-ujs
project](https://github.com/kevinvaldek/mootools-ujs).

* If the mootools or mootools-more scripts are outdated (i.e. maybe a
  new version of MooTools was released yesterday), feel free to open an
issue and prod me to get that thing updated. However, for security
reasons, I won't be accepting pull requests with updated mootools or
mootools-more scripts.

## Acknowledgements

Many thanks to the [jquery-rails](https://github.com/rails/jquery-rails)
guys.

Copyright [Daniel Spangenberg](http://neonlex.com), released under the MIT License.
