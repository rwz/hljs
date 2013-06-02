require "hljs/version"
require "forwardable"

module HLJS
  class UnsupportedSyntaxError < SyntaxError; end

  extend Forwardable
  def_delegators :adapter, :highlight, :supported_syntaxes

  def adapter
    @adapter ||= begin
      require "hljs/adapters/highlight_js"
      Adapters::HighlightJS.instance
    end
  end

  module_function :adapter, :highlight, :supported_syntaxes
end