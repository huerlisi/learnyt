require 'spec_helper'

describe "responses/show.html.haml" do
  before(:each) do
    @response = assign(:response, stub_model(Response))
  end

  it "renders attributes in <p>" do
    render
  end
end
