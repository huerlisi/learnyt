require 'spec_helper'

describe "quiz_responses/edit.html.haml" do
  before(:each) do
    @quiz_response = assign(:quiz_response, stub_model(QuizResponse,
      :new_record? => false
    ))
  end

  it "renders the edit quiz_response form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => quiz_response_path(@quiz_response), :method => "post" do
    end
  end
end
