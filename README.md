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
</p>

**Documented** writes documentation for you, from your tests. Never have out of date documentation again!

Designed to work with https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid for now.

## Usage  

Add `# documented:enable` and `# documented:disable` comments anywhere in your tests:
```ruby
# documented:enable
my_method(do_stuff: true)
# documented:disable
```  

Then run your test via the `documented` CLI like:
```
documented spec/example_spec.rb
```

Documentation will start showing up in the `documented` folder:
<p align="center">
  <img src="./assets/screenshot.png" raw=true style="margin-left: auto; margin-right: auto;"/>
</p>

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