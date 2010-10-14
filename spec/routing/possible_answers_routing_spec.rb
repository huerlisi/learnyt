require "spec_helper"

describe PossibleAnswersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/possible_answers" }.should route_to(:controller => "possible_answers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/possible_answers/new" }.should route_to(:controller => "possible_answers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/possible_answers/1" }.should route_to(:controller => "possible_answers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/possible_answers/1/edit" }.should route_to(:controller => "possible_answers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/possible_answers" }.should route_to(:controller => "possible_answers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/possible_answers/1" }.should route_to(:controller => "possible_answers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/possible_answers/1" }.should route_to(:controller => "possible_answers", :action => "destroy", :id => "1")
    end

  end
end
