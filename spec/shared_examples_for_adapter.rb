shared_examples_for "an adapter" do
  it "raises an error when syntax is unsupported" do
    broken_hl_call = ->{ subject.highlight "foo", "bar" }
    expected_error = [ HLJS::UnsupportedSyntaxError, "\"bar\" syntax is not supported" ]
    expect(&broken_hl_call).to raise_error(*expected_error)
  end

  it "inspect should include version and syntaxes info" do
    version = subject.version
    syntaxes = subject.supported_syntaxes.count

    expect(subject.inspect).to include("Version #{version}, #{syntaxes} syntaxes supported")
  end
end
