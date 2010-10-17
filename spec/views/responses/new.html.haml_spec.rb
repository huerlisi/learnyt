require 'spec_helper'

describe "responses/new.html.haml" do
  before(:each) do
    assign(:response, stub_model(Response).as_new_record)
  end

  it "renders new response form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => responses_path, :method => "post" do
    end
  end
end
