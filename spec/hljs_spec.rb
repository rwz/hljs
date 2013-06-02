require "spec_helper"

describe HLJS do
  it "delegates #highlight to adapter" do
    expect(described_class.adapter).to receive(:highlight).with("foo", "bar")
    described_class.highlight "foo", "bar"
  end

  it "delegates #supported_syntaxes to adapter" do
    expect(described_class.adapter).to receive(:supported_syntaxes).once
    described_class.supported_syntaxes
  end

  describe "#adapter=" do
    args = ["highlightjs", "highlight_js", "highlight js", "HIGHLIGHTJS",
        :highlightjs, :highlight_js]

    args.each do |arg|
      it "should enable HighlightJS with #{arg.inspect}" do
        described_class.adapter = arg
        expect(described_class.adapter).to be_instance_of(described_class::Adapters::HighlightJS)
      end
    end

    args = ["SyntaxHighlighter", "Syntax Highlighter", "syntax_highlighter",
      :syntax_highlighter, :syntaxhighlighter, :SyntaxHighlighter]

    args.each do |arg|
      it "should enable SyntaxHighlighter with #{arg.inspect}" do
        described_class.adapter = arg
        expect(described_class.adapter).to be_instance_of(described_class::Adapters::SyntaxHighlighter)
      end
    end

    it "raises an ArgumentError on invalid input" do
      expect{HLJS.adapter=:foo}.to raise_error(ArgumentError, "invalid adapter :foo")
    end
  end
end
