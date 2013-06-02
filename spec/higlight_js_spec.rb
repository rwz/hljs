require "spec_helper"
require "shared_examples_for_adapter"
require "hljs/adapters/highlight_js"

describe HLJS::Adapters::HighlightJS do
  subject{ described_class.instance }

  it_behaves_like "an adapter"

  assert_highlighted "highlight.js", "html.xml",      "xml"
  assert_highlighted "highlight.js", "python.py",     "python"
  assert_highlighted "highlight.js", "ruby.rb",       "ruby"
  assert_highlighted "highlight.js", "javascript.js", "javascript"

  syntaxes = %w(1c actionscript apache applescript avrasm axapta bash brainfuck
    clojure cmake coffeescript cpp cs css d delphi diff django dos erlang
    erlang-repl glsl go haskell http ini java javascript json lisp lua markdown
    matlab mel nginx objectivec parser3 perl php profile python r rib rsl ruby
    rust scala smalltalk sql tex vala vbscript vhdl xml)

  it "supports 54 syntaxes" do
    expect(subject.supported_syntaxes).to eq(syntaxes)
  end

  its(:version){ should eq("7.3") }

  it "tries to guess the syntax if argument is not provided" do
    code = %{var foo = function(){ return "bar"; };}
    highlighted = %{<span class="keyword">var</span> foo = <span class="keyword">function</span>(){ <span class="keyword">return</span> <span class="string">"bar"</span>; };}
    expect(subject.highlight(code)).to eq(highlighted)
  end
end