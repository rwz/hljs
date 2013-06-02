require "spec_helper"
require "shared_examples_for_adapter"
require "hljs/adapters/syntax_highlighter"

describe HLJS::Adapters::SyntaxHighlighter do
  it_behaves_like "an adapter"

  assert_highlighted "SyntaxHighlighter", "html.xml",      "Xml"
  assert_highlighted "SyntaxHighlighter", "python.py",     "Python"
  assert_highlighted "SyntaxHighlighter", "ruby.rb",       "Ruby"
  assert_highlighted "SyntaxHighlighter", "javascript.js", "JScript"

  syntaxes = %w(AS3 AppleScript Bash CSS CSharp ColdFusion Cpp Delphi Diff
    Erlang Groovy JScript Java JavaFX Perl Php Plain PowerShell Python Ruby
    Sass Scala Sql Vb Xml)

  it "supports 25 syntaxes" do
    expect(subject.supported_syntaxes).to eq(syntaxes)
  end

  its(:version){ should eq("3.0.83") }
end