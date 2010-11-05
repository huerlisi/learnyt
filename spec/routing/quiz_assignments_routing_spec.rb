require "spec_helper"

describe QuizAssignmentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/quiz_assignments" }.should route_to(:controller => "quiz_assignments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/quiz_assignments/new" }.should route_to(:controller => "quiz_assignments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/quiz_assignments/1" }.should route_to(:controller => "quiz_assignments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/quiz_assignments/1/edit" }.should route_to(:controller => "quiz_assignments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/quiz_assignments" }.should route_to(:controller => "quiz_assignments", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/quiz_assignments/1" }.should route_to(:controller => "quiz_assignments", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/quiz_assignments/1" }.should route_to(:controller => "quiz_assignments", :action => "destroy", :id => "1")
    end

  end
end
