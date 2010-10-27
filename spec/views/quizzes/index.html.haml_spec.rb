require 'spec_helper'

describe "quizzes/index.html.haml" do
  before(:each) do
    assign(:quizzes, [
      stub_model(Quiz),
      stub_model(Quiz)
    ])
  end

  it "renders a list of quizzes" do
    render
  end
end
