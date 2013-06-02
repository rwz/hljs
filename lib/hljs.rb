require "hljs/version"
require "forwardable"

module HLJS
  class UnsupportedSyntaxError < SyntaxError; end

  extend Forwardable
  def_delegators :adapter, :highlight, :supported_syntaxes

  def adapter
    self.adapter = :highlightjs unless @adapter
    @adapter
  end

  def adapter=(new_adapter)
    @adapter = case new_adapter.to_s
    when /highlight[\s_]?js/i
      require "hljs/adapters/highlight_js"
      Adapters::HighlightJS.instance
    when /syntax[\s_]?highlighter/i
      require "hljs/adapters/syntax_highlighter"
      Adapters::SyntaxHighlighter.instance
    else
      raise ArgumentError, "invalid adapter #{new_adapter.inspect}"
    end

    @adapter
  end

  module_function :adapter, :adapter=, :highlight, :supported_syntaxes
end