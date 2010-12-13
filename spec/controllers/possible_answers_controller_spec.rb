require 'spec_helper'

describe PossibleAnswersController do
  login_admin
  
  def mock_possible_answer(stubs={})
    @mock_possible_answer ||= mock_model(PossibleAnswer, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all possible_answers as @possible_answers" do
      PossibleAnswer.stub(:all) { [mock_possible_answer] }
      get :index
      assigns(:possible_answers).should eq([mock_possible_answer])
    end
  end

  describe "GET show" do
    it "assigns the requested possible_answer as @possible_answer" do
      PossibleAnswer.stub(:find).with("37") { mock_possible_answer }
      get :show, :id => "37"
      assigns(:possible_answer).should be(mock_possible_answer)
    end
  end

  describe "GET new" do
    it "assigns a new possible_answer as @possible_answer" do
      PossibleAnswer.stub(:new) { mock_possible_answer }
      get :new
      assigns(:possible_answer).should be(mock_possible_answer)
    end
  end

  describe "GET edit" do
    it "assigns the requested possible_answer as @possible_answer" do
      PossibleAnswer.stub(:find).with("37") { mock_possible_answer }
      get :edit, :id => "37"
      assigns(:possible_answer).should be(mock_possible_answer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created possible_answer as @possible_answer" do
        PossibleAnswer.stub(:new).with({'these' => 'params'}) { mock_possible_answer(:save => true) }
        post :create, :possible_answer => {'these' => 'params'}
        assigns(:possible_answer).should be(mock_possible_answer)
      end

      it "redirects to the created possible_answer" do
        PossibleAnswer.stub(:new) { mock_possible_answer(:save => true) }
        post :create, :possible_answer => {}
        response.should redirect_to(possible_answer_url(mock_possible_answer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved possible_answer as @possible_answer" do
        PossibleAnswer.stub(:new).with({'these' => 'params'}) { mock_possible_answer(:save => false) }
        post :create, :possible_answer => {'these' => 'params'}
        assigns(:possible_answer).should be(mock_possible_answer)
      end

      it "re-renders the 'new' template" do
        PossibleAnswer.stub(:new) { mock_possible_answer(:save => false) }
        post :create, :possible_answer => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested possible_answer" do
        PossibleAnswer.should_receive(:find).with("37") { mock_possible_answer }
        mock_possible_answer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :possible_answer => {'these' => 'params'}
      end

      it "assigns the requested possible_answer as @possible_answer" do
        PossibleAnswer.stub(:find) { mock_possible_answer(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:possible_answer).should be(mock_possible_answer)
      end

      it "redirects to the possible_answer" do
        PossibleAnswer.stub(:find) { mock_possible_answer(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(possible_answer_url(mock_possible_answer))
      end
    end

    describe "with invalid params" do
      it "assigns the possible_answer as @possible_answer" do
        PossibleAnswer.stub(:find) { mock_possible_answer(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:possible_answer).should be(mock_possible_answer)
      end

      it "re-renders the 'edit' template" do
        PossibleAnswer.stub(:find) { mock_possible_answer(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested possible_answer" do
      PossibleAnswer.should_receive(:find).with("37") { mock_possible_answer }
      mock_possible_answer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the possible_answers list" do
      PossibleAnswer.stub(:find) { mock_possible_answer }
      delete :destroy, :id => "1"
      response.should redirect_to(possible_answers_url)
    end
  end

end
