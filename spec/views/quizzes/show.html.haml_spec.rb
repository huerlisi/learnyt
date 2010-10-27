require 'spec_helper'

describe "quizzes/show.html.haml" do
  before(:each) do
    @quiz = assign(:quiz, stub_model(Quiz))
  end

  it "renders attributes in <p>" do
    render
  end
end
