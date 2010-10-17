require 'spec_helper'

describe "responses/edit.html.haml" do
  before(:each) do
    @response = assign(:response, stub_model(Response,
      :new_record? => false
    ))
  end

  it "renders the edit response form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => response_path(@response), :method => "post" do
    end
  end
end
