require "spec_helper"

describe QuizResponsesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/quiz_responses" }.should route_to(:controller => "quiz_responses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/quiz_responses/new" }.should route_to(:controller => "quiz_responses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/quiz_responses/1" }.should route_to(:controller => "quiz_responses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/quiz_responses/1/edit" }.should route_to(:controller => "quiz_responses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/quiz_responses" }.should route_to(:controller => "quiz_responses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/quiz_responses/1" }.should route_to(:controller => "quiz_responses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/quiz_responses/1" }.should route_to(:controller => "quiz_responses", :action => "destroy", :id => "1")
    end

  end
end
