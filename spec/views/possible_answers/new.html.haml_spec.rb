require 'spec_helper'

describe "possible_answers/new.html.haml" do
  login_admin
  
  before(:each) do
    assign(:possible_answer, stub_model(PossibleAnswer).as_new_record)
  end

  it "renders new possible_answer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => possible_answers_path, :method => "post" do
    end
  end
end
