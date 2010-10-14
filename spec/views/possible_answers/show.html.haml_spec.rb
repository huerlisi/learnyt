require 'spec_helper'

describe "possible_answers/show.html.haml" do
  before(:each) do
    @possible_answer = assign(:possible_answer, stub_model(PossibleAnswer))
  end

  it "renders attributes in <p>" do
    render
  end
end
