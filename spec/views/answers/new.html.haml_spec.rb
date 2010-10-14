require 'spec_helper'

describe "answers/new.html.haml" do
  before(:each) do
    assign(:answer, stub_model(Answer).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => answers_path, :method => "post" do
    end
  end
end
