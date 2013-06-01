require "hljs"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def assert_highlighted(adapter, extension, lang=extension)
  it "highlights #{lang} correctly" do
    path = File.expand_path("../fixtures/#{adapter}", __FILE__)
    source_path = File.join(path, "input/input.#{extension}")
    output_path = File.join(path, "output/output.#{extension}.html")
    source = File.read(source_path)
    output = File.read(output_path)

    expect(subject.highlight(source, lang)).to eq(output)
  end
end
