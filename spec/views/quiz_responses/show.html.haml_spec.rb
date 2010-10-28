require 'spec_helper'

describe "quiz_responses/show.html.haml" do
  before(:each) do
    @quiz_response = assign(:quiz_response, stub_model(QuizResponse))
  end

  it "renders attributes in <p>" do
    render
  end
end
