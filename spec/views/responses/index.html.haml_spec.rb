require 'spec_helper'

describe "responses/index.html.haml" do
  before(:each) do
    assign(:responses, [
      stub_model(Response),
      stub_model(Response)
    ])
  end

  it "renders a list of responses" do
    render
  end
end
