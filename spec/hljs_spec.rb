require "spec_helper"

describe HLJS do
  describe "#adapter" do
    it "should be HighlightJS" do
      expect(described_class.adapter).to be_kind_of(described_class::Adapters::HighlightJS)
    end
  end

  it "delegates #highlight to adapter" do
    expect(described_class.adapter).to receive(:highlight).with("foo", "bar")
    described_class.highlight "foo", "bar"
  end

  it "delegates #supported_syntaxes to adapter" do
    expect(described_class.adapter).to receive(:supported_syntaxes).once
    described_class.supported_syntaxes
  end
end
