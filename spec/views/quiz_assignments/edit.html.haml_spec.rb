require 'spec_helper'

describe "quiz_assignments/edit.html.haml" do
  before(:each) do
    @quiz_assignment = assign(:quiz_assignment, stub_model(QuizAssignment,
      :new_record? => false
    ))
  end

  it "renders the edit quiz_assignment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => quiz_assignment_path(@quiz_assignment), :method => "post" do
    end
  end
end
