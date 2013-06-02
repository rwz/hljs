require 'hljs/adapter'

module HLJS
  module Adapters
    class HighlightJS < Adapter
      source_paths "highlight.js"

      def highlight(code, lang=nil)
        args = [code]

        if lang
          check_if_syntax_supported! lang
          args = [ "hljs.highlight", lang ].concat(args)
        else
          args.unshift "hljs.highlightAuto"
        end

        context.call(*args)["value"]
      end

      def supported_syntaxes
        super{ context.eval("Object.keys(hljs.LANGUAGES)") }
      end

      def version
        "7.3"
      end

    end
  end
end
