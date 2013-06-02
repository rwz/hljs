require "execjs"

module HLJS
  class Adapter

    def inspect
      additions = "Version #{version}, #{supported_syntaxes.count} syntaxes supported"
      to_s.sub(/>\z/, " #{additions}>")
    end

    def supported_syntaxes
      @supported_syntaxes ||= yield.sort
    end

    private

    def self.source_paths(*patterns)
      define_method :source_paths do
        base_path = File.expand_path("../../../vendor", __FILE__)
        patterns.map{ |pattern| Dir["#{base_path}/#{pattern}"] }.flatten.uniq
      end
    end

    def source
      @source ||= String.new.tap do |source|
        source_paths.each do |path|
          source << File.read(path)
        end
      end
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
