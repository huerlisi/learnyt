require 'spec_helper'

describe "possible_answers/edit.html.haml" do
  before(:each) do
    @possible_answer = assign(:possible_answer, stub_model(PossibleAnswer,
      :new_record? => false
    ))
  end

  it "renders the edit possible_answer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => possible_answer_path(@possible_answer), :method => "post" do
    end
  end
end
