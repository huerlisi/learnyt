require 'spec_helper'

describe QuizAssignmentsController do
  login_admin
  
  def mock_quiz_assignment(stubs={})
    (@mock_quiz_assignment ||= mock_model(QuizAssignment).as_null_object).tap do |quiz_assignment|
      quiz_assignment.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all quiz_assignments as @quiz_assignments" do
      QuizAssignment.stub(:all) { [mock_quiz_assignment] }
      get :index
      assigns(:quiz_assignments).should eq([mock_quiz_assignment])
    end
  end

  describe "GET show" do
    it "assigns the requested quiz_assignment as @quiz_assignment" do
      QuizAssignment.stub(:find).with("37") { mock_quiz_assignment }
      get :show, :id => "37"
      assigns(:quiz_assignment).should be(mock_quiz_assignment)
    end
  end

  describe "GET new" do
    it "assigns a new quiz_assignment as @quiz_assignment" do
      QuizAssignment.stub(:new) { mock_quiz_assignment }
      get :new
      assigns(:quiz_assignment).should be(mock_quiz_assignment)
    end
  end

  describe "GET edit" do
    it "assigns the requested quiz_assignment as @quiz_assignment" do
      QuizAssignment.stub(:find).with("37") { mock_quiz_assignment }
      get :edit, :id => "37"
      assigns(:quiz_assignment).should be(mock_quiz_assignment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created quiz_assignment as @quiz_assignment" do
        QuizAssignment.stub(:new).with({'these' => 'params'}) { mock_quiz_assignment(:save => true) }
        post :create, :quiz_assignment => {'these' => 'params'}
        assigns(:quiz_assignment).should be(mock_quiz_assignment)
      end

      it "redirects to the created quiz_assignment" do
        QuizAssignment.stub(:new) { mock_quiz_assignment(:save => true) }
        post :create, :quiz_assignment => {}
        response.should redirect_to(quiz_assignment_url(mock_quiz_assignment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quiz_assignment as @quiz_assignment" do
        QuizAssignment.stub(:new).with({'these' => 'params'}) { mock_quiz_assignment(:save => false) }
        post :create, :quiz_assignment => {'these' => 'params'}
        assigns(:quiz_assignment).should be(mock_quiz_assignment)
      end

      it "re-renders the 'new' template" do
        QuizAssignment.stub(:new) { mock_quiz_assignment(:save => false) }
        post :create, :quiz_assignment => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested quiz_assignment" do
        QuizAssignment.should_receive(:find).with("37") { mock_quiz_assignment }
        mock_quiz_assignment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :quiz_assignment => {'these' => 'params'}
      end

      it "assigns the requested quiz_assignment as @quiz_assignment" do
        QuizAssignment.stub(:find) { mock_quiz_assignment(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:quiz_assignment).should be(mock_quiz_assignment)
      end

      it "redirects to the quiz_assignment" do
        QuizAssignment.stub(:find) { mock_quiz_assignment(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(quiz_assignment_url(mock_quiz_assignment))
      end
    end

    describe "with invalid params" do
      it "assigns the quiz_assignment as @quiz_assignment" do
        QuizAssignment.stub(:find) { mock_quiz_assignment(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:quiz_assignment).should be(mock_quiz_assignment)
      end

      it "re-renders the 'edit' template" do
        QuizAssignment.stub(:find) { mock_quiz_assignment(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested quiz_assignment" do
      QuizAssignment.should_receive(:find).with("37") { mock_quiz_assignment }
      mock_quiz_assignment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the quiz_assignments list" do
      QuizAssignment.stub(:find) { mock_quiz_assignment }
      delete :destroy, :id => "1"
      response.should redirect_to(quiz_assignments_url)
    end
  end

end
