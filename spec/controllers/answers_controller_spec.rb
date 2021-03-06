require 'spec_helper'

describe AnswersController do
  login_admin
    
  def mock_answer(stubs={})
    @mock_answer ||= mock_model(Answer, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all answers as @answers" do
      Answer.stub(:all) { [mock_answer] }
      get :index
      assigns(:answers).should eq([mock_answer])
    end
  end

  describe "GET show" do
    it "assigns the requested answer as @answer" do
      Answer.stub(:find).with("37") { mock_answer }
      get :show, :id => "37"
      assigns(:answer).should be(mock_answer)
    end
  end

  describe "GET new" do
    it "assigns a new answer as @answer" do
      Answer.stub(:new) { mock_answer }
      get :new
      assigns(:answer).should be(mock_answer)
    end
  end

  describe "GET edit" do
    it "assigns the requested answer as @answer" do
      Answer.stub(:find).with("37") { mock_answer }
      get :edit, :id => "37"
      assigns(:answer).should be(mock_answer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created answer as @answer" do
        Answer.stub(:new).with({'these' => 'params'}) { mock_answer(:save => true) }
        post :create, :answer => {'these' => 'params'}
        assigns(:answer).should be(mock_answer)
      end

      it "redirects to the created answer" do
        Answer.stub(:new) { mock_answer(:save => true) }
        post :create, :answer => {}
        response.should redirect_to(answer_url(mock_answer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved answer as @answer" do
        Answer.stub(:new).with({'these' => 'params'}) { mock_answer(:save => false) }
        post :create, :answer => {'these' => 'params'}
        assigns(:answer).should be(mock_answer)
      end

      it "re-renders the 'new' template" do
        Answer.stub(:new) { mock_answer(:save => false) }
        post :create, :answer => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested answer" do
        Answer.should_receive(:find).with("37") { mock_answer }
        mock_answer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :answer => {'these' => 'params'}
      end

      it "assigns the requested answer as @answer" do
        Answer.stub(:find) { mock_answer(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:answer).should be(mock_answer)
      end

      it "redirects to the answer" do
        Answer.stub(:find) { mock_answer(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(answer_url(mock_answer))
      end
    end

    describe "with invalid params" do
      it "assigns the answer as @answer" do
        Answer.stub(:find) { mock_answer(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:answer).should be(mock_answer)
      end

      it "re-renders the 'edit' template" do
        Answer.stub(:find) { mock_answer(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested answer" do
      Answer.should_receive(:find).with("37") { mock_answer }
      mock_answer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the answers list" do
      Answer.stub(:find) { mock_answer }
      delete :destroy, :id => "1"
      response.should redirect_to(answers_url)
    end
  end

end
