require 'spec_helper'

describe "quiz_assignments/index.html.haml" do
  before(:each) do
    assign(:quiz_assignments, [
      stub_model(QuizAssignment),
      stub_model(QuizAssignment)
    ])
  end

  it "renders a list of quiz_assignments" do
    render
  end
end
