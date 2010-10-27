require 'spec_helper'

describe "quizzes/new.html.haml" do
  before(:each) do
    assign(:quiz, stub_model(Quiz).as_new_record)
  end

  it "renders new quiz form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => quizzes_path, :method => "post" do
    end
  end
end
