require 'spec_helper'

describe "questions/index.html.haml" do
  before(:each) do
    assign(:questions, [
      Factory(:question),
      Factory(:question)
    ].paginate(:page => 1))
  end

  it "renders a list of questions" do
    render
  end
end
