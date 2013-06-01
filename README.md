# HLJS

HLJS allows to use javascript code highlighting libraries from ruby. Cool, huh?
It's cooler than Pygments-based solution because it doesn't need python. It's cooler
than client-side highlighting because... I have no idea why, actually.
But anyways.

## Installation

Add this line to your application's Gemfile:

    gem 'hljs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hljs

## Usage

For now only highlight.js adapter is supported.

```ruby
HLJS.highlight source, language # => highlighted source
HLJS.supported_syntaxes         # => the list of all supported syntaxes
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
