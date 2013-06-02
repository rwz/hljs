require "spec_helper"
require "hljs/adapters/highlight_js"

describe HLJS::Adapters::HighlightJS do
  assert_highlighted "highlight.js", :xml
  assert_highlighted "highlight.js", :py, :python
  assert_highlighted "highlight.js", :rb, :ruby
  assert_highlighted "highlight.js", :js, :javascript

  its(:inspect){ should include("Version 7.3, 54 syntaxes supported") }

  it "tries to guess the syntax if argument is not provided" do
    code = %{var foo = function(){ return "bar"; };}
    highlighted = %{<span class="keyword">var</span> foo = <span class="keyword">function</span>(){ <span class="keyword">return</span> <span class="string">"bar"</span>; };}
    expect(subject.highlight(code)).to eq(highlighted)
  end

  it "raises an error when syntax is unsupported" do
    broken_hl_call = ->{ subject.highlight "foo", "bar" }
    expected_error = [ HLJS::UnsupportedSyntaxError, "\"bar\" syntax is not supported" ]
    expect(&broken_hl_call).to raise_error(*expected_error)
  end
end