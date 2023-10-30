# Documented

<p align="center">
  <a href="https://www.mozilla.org/MPL/2.0/" alt="MPLv2 License">
    <img src="https://img.shields.io/badge/license-MPLv2-blue.svg" />
  </a>
  <a href="https://rubygems.org/gems/documented">
    <img src="https://badge.fury.io/rb/documented.svg" alt="Gem Version" />
  </a>
  <img src="https://img.shields.io/github/languages/code-size/greensync/documented" alt="GitHub code size in bytes">
  <img src="https://img.shields.io/gem/dt/documented">
  <a href="https://www.codetriage.com/greensync/documented" alt="Open Source Helpers">
    <img src="https://www.codetriage.com/greensync/documented/badges/users.svg" />
  </a>
</p>

**Documented** writes documentation for you, from your tests. Never have out of date documentation again!

Designed to work with https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid for now.

## Usage  

Add `# documented:enable` and `# documented:disable` anywhere in your tests:
```ruby
# documented:enable
my_method(do_stuff: true)
# documented:disable
```  

Run tests via the `documented` CLI and documentation will start showing up in the `documented` folder:

## Installation

In Gemfile add:
```ruby
gem "documented"
```  

In terminal run:
```
bundle install
```

Or:
```
gem install documented
```

## Configuration

```ruby
Documented.configure do |config|
  config.blocklist = {
    'ExampleClass',
  }
end
```

See `Config.rb` for more configuration options.