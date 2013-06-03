# HLJS

HLJS allows to use javascript code highlighting libraries from ruby. Cool, huh?
It's cooler than Pygments-based solution because it doesn't need python. It's cooler
than client-side highlighting because... I have no idea why, actually.
But anyways.

## Requirements

HLJS requires Ruby 1.9+ mainly because I'm too lazy porting it to 1.8. Also, I don't even remember
when was the last time I used 1.8 for something other than running specs. Feel free to send
pull-request if you need 1.8 support.

## Installation

Add this line to your application's Gemfile:

    gem 'hljs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hljs

## Usage

For now only two adapters are supported: [highlight.js](https://github.com/isagalaev/highlight.js)
and [SyntaxHighlighter](https://github.com/alexgorbatchev/SyntaxHighlighter).

```ruby
HLJS.highlight source, language # => highlighted source
HLJS.supported_syntaxes         # => the list of all supported syntaxes
```

Swithing adapters is quite straightforward:

```ruby
>> HLJS.adapter = :highlightjs
=> #<HLJS::Adapters::HighlightJS:0x007ffb5a0a0a48 Version 7.3, 54 syntaxes supported>
>> HLJS.adapter = :syntaxhighlighter
=> #<HLJS::Adapters::SyntaxHighlighter:0x007fb35448a990 Version 3.0.83, 25 syntaxes supported>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
