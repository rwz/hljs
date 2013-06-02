require 'hljs/adapter'

module HLJS
  module Adapters
    class SyntaxHighlighter < Adapter

      source_paths "SyntaxHighlighter/shCore.js", "SyntaxHighlighter/shBrush*.js"

      def highlight(code, lang)
        check_if_syntax_supported! lang
        func = "(function(code){ var a = new SyntaxHighlighter.brushes.#{lang}; a.init(); return a.getHtml(code); })"
        context.call func, code
      end

      def supported_syntaxes
        super{ context.eval("Object.keys(SyntaxHighlighter.brushes)") }
      end

      def version
        source[/@version\n[\s*]+([\d.]+)/, 1]
      end

    end
  end
end
