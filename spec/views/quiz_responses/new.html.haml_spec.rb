require 'spec_helper'

describe "quiz_responses/new.html.haml" do
  before(:each) do
    assign(:quiz_response, stub_model(QuizResponse).as_new_record)
  end

  it "renders new quiz_response form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => quiz_responses_path, :method => "post" do
    end
  end
end
