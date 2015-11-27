![alt text](http://www.hitfoxgroup.com/downloads/hitfox_logo_with_tag_two_colors_WEB.png "Logo Hitfox Group")

Foxynew
==============

[![Build Status](https://img.shields.io/travis/HitFox/cm-sms-rails.svg?style=flat-square)](https://travis-ci.org/HitFox/cm-sms-rails)
[![Gem](https://img.shields.io/gem/dt/cm-sms-rails.svg?style=flat-square)](https://rubygems.org/gems/cm-sms-rails)
[![Code Climate](https://img.shields.io/codeclimate/github/HitFox/cm-sms-rails.svg?style=flat-square)](https://codeclimate.com/github/HitFox/cm-sms-rails)
[![Coverage](https://img.shields.io/coveralls/HitFox/cm-sms-rails.svg?style=flat-square)](https://coveralls.io/github/HitFox/cm-sms-rails)

Description
-----------

This is a Rails wrapper to the PR.co API, which pulls in your PR.co content and lets you display it completely on your own website. This lets you keep the SEO juice that comes from your press releases and have more control over styling.

As a namespaced Rails engine, +foxynews+ can be easily overwritten to suit your individual needs.

Installation
------------

If you are using bundler, add this line to your Gemfile:

```ruby
gem 'foxynews', git: 'git@github.com:HitFox/foxynews.git'
```
And install your gem:

```ruby
$ bundle install
```
If you are not using bundler just type:

```
$ gem install foxynews
```
After you have installed the gem, generate the intialzer:
```
$ rails g foxynews:initializer
```
Browse to the generated initializer. You should found it in config/initializers/foxynews.rb.
Change here +YOUR_PR_CO_ID_HERE+ to your PR.co pressroom ID.

Now you have to mount the engine in your routes file.
```ruby
mount Foxynews::Engine => '/pr', as: 'foxynews'
```
Usage
-----

By default a pressroom in your app is accessible at +/pr/pressrooms+.

Other routes are:

* pr/pressrooms/show/:id

* pr/pressrooms/archive

* pr/presskit/show/:id

Archives display older articles, presskits display individual PR.co presskits.

Changelog
---------

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HitFox/cm-sms-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
