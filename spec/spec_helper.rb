require "hljs"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def assert_highlighted(adapter, filename, lang)
  it "highlights #{lang}" do
    path = File.expand_path("../fixtures", __FILE__)
    source_path = File.join(path, "input", filename)
    output_path = File.join(path, adapter, "#{filename}.html")
    source = File.read(source_path)
    output = File.read(output_path)

    highlighted = subject.highlight(source, lang)
    highlighted.sub! /highlighter_\d+/, "highlighter_1337"

    expect(highlighted).to eq(output)
  end
end
