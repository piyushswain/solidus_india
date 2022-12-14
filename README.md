# Solidus India

[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_india.svg?style=shield)](https://circleci.com/gh/solidusio-contrib/solidus_india)
[![codecov](https://codecov.io/gh/solidusio-contrib/solidus_india/branch/master/graph/badge.svg)](https://codecov.io/gh/solidusio-contrib/solidus_india)

<!-- Explain what your extension does. -->

## Installation

Add solidus_india to your Gemfile:

```ruby
gem 'solidus_india'
```

Bundle your dependencies and run the installation generator:

```shell
bin/rails generate solidus_india:install
```

Go to `config/initializers/spree.rb` and change the following line

```ruby
# Default currency for new sites
  config.currency = "USD"
```

to

```ruby
# Default currency for new sites
  config.currency = "INR"
```

This will allow you to use all the INR specific products, taxes and shipping methods added by the seeds.

## Usage

This extension adds seeds and required functionality to modify the base Solidus Store into an ecommerce store in the indian context.

The base Solidus store is more USA and Europe friendly with products, prices, shipping and taxes based on those regions. For newcomers to Solidus from a region other than the USA and Europe, it becomes quite difficult to start a new project on Solidus.

As soon as you finish the installation, you can start the server and find that the base Solidus Store now works as an Indian ecommerce store with all the prices, taxes and shipping methods in INR and working for an indian context.

I would also recommend using the [solidus_razorpay](https://github.com/solidusio-contrib/solidus_razorpay) extension to allow your store to make UPI payments with the help of the Razorpay payment integration.

## Development

### Testing the extension

First bundle your dependencies, then run `bin/rake`. `bin/rake` will default to building the dummy
app if it does not exist, then it will run specs. The dummy app can be regenerated by using
`bin/rake extension:test_app`.

```shell
bin/rake
```

To run [Rubocop](https://github.com/bbatsov/rubocop) static code analysis run

```shell
bundle exec rubocop
```

When testing your application's integration with this extension you may use its factories.
Simply add this require statement to your `spec/spec_helper.rb`:

```ruby
require 'solidus_india/testing_support/factories'
```

Or, if you are using `FactoryBot.definition_file_paths`, you can load Solidus core
factories along with this extension's factories using this statement:

```ruby
SolidusDevSupport::TestingSupport::Factories.load_for(SolidusIndia::Engine)
```

### Running the sandbox

To run this extension in a sandboxed Solidus application, you can run `bin/sandbox`. The path for
the sandbox app is `./sandbox` and `bin/rails` will forward any Rails commands to
`sandbox/bin/rails`.

Here's an example:

```
$ bin/rails server
=> Booting Puma
=> Rails 6.0.2.1 application starting in development
* Listening on tcp://127.0.0.1:3000
Use Ctrl-C to stop
```

### Updating the changelog

Before and after releases the changelog should be updated to reflect the up-to-date status of
the project:

```shell
bin/rake changelog
git add CHANGELOG.md
git commit -m "Update the changelog"
```

### Releasing new versions

Please refer to the dedicated [page](https://github.com/solidusio/solidus/wiki/How-to-release-extensions) on Solidus wiki.

## License

Copyright (c) 2022 [name of extension author], released under the New BSD License.
