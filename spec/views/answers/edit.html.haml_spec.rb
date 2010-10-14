require 'spec_helper'

describe "answers/edit.html.haml" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :new_record? => false
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => answer_path(@answer), :method => "post" do
    end
  end
end
