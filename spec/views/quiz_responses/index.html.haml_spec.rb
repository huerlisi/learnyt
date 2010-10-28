require 'spec_helper'

describe "quiz_responses/index.html.haml" do
  before(:each) do
    assign(:quiz_responses, [
      stub_model(QuizResponse),
      stub_model(QuizResponse)
    ])
  end

  it "renders a list of quiz_responses" do
    render
  end
end
