require "execjs"

module HLJS
  class Adapter

    def inspect
      additions = "Version #{version}, #{supported_syntaxes.count} syntaxes supported"
      to_s.sub(/>\z/, " #{additions}>")
    end

    private

    def self.source_file(path)
      define_method :source_path do
        File.expand_path("../../../vendor/#{path}", __FILE__)
      end
    end

    def source
      File.read(source_path)
    end

    def context
      @context ||= ExecJS.compile(source)
    end

    def check_if_syntax_supported!(syntax)
      raise UnsupportedSyntaxError, "#{syntax.inspect} syntax is not supported" unless support_syntax?(syntax)
    end

    def support_syntax?(syntax)
      supported_syntaxes.include?(syntax.to_s)
    end

  end
end
