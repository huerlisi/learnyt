require 'spec_helper'

describe "quiz_assignments/show.html.haml" do
  before(:each) do
    @quiz_assignment = assign(:quiz_assignment, stub_model(QuizAssignment))
  end

  it "renders attributes in <p>" do
    render
  end
end
