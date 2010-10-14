require 'spec_helper'

describe "possible_answers/index.html.haml" do
  before(:each) do
    assign(:possible_answers, [
      stub_model(PossibleAnswer),
      stub_model(PossibleAnswer)
    ])
  end

  it "renders a list of possible_answers" do
    render
  end
end
