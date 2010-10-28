require 'spec_helper'

describe QuizResponsesController do

  def mock_quiz_response(stubs={})
    @mock_quiz_response ||= mock_model(QuizResponse, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all quiz_responses as @quiz_responses" do
      QuizResponse.stub(:all) { [mock_quiz_response] }
      get :index
      assigns(:quiz_responses).should eq([mock_quiz_response])
    end
  end

  describe "GET show" do
    it "assigns the requested quiz_response as @quiz_response" do
      QuizResponse.stub(:find).with("37") { mock_quiz_response }
      get :show, :id => "37"
      assigns(:quiz_response).should be(mock_quiz_response)
    end
  end

  describe "GET new" do
    it "assigns a new quiz_response as @quiz_response" do
      QuizResponse.stub(:new) { mock_quiz_response }
      get :new
      assigns(:quiz_response).should be(mock_quiz_response)
    end
  end

  describe "GET edit" do
    it "assigns the requested quiz_response as @quiz_response" do
      QuizResponse.stub(:find).with("37") { mock_quiz_response }
      get :edit, :id => "37"
      assigns(:quiz_response).should be(mock_quiz_response)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created quiz_response as @quiz_response" do
        QuizResponse.stub(:new).with({'these' => 'params'}) { mock_quiz_response(:save => true) }
        post :create, :quiz_response => {'these' => 'params'}
        assigns(:quiz_response).should be(mock_quiz_response)
      end

      it "redirects to the created quiz_response" do
        QuizResponse.stub(:new) { mock_quiz_response(:save => true) }
        post :create, :quiz_response => {}
        response.should redirect_to(quiz_response_url(mock_quiz_response))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quiz_response as @quiz_response" do
        QuizResponse.stub(:new).with({'these' => 'params'}) { mock_quiz_response(:save => false) }
        post :create, :quiz_response => {'these' => 'params'}
        assigns(:quiz_response).should be(mock_quiz_response)
      end

      it "re-renders the 'new' template" do
        QuizResponse.stub(:new) { mock_quiz_response(:save => false) }
        post :create, :quiz_response => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested quiz_response" do
        QuizResponse.should_receive(:find).with("37") { mock_quiz_response }
        mock_quiz_response.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :quiz_response => {'these' => 'params'}
      end

      it "assigns the requested quiz_response as @quiz_response" do
        QuizResponse.stub(:find) { mock_quiz_response(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:quiz_response).should be(mock_quiz_response)
      end

      it "redirects to the quiz_response" do
        QuizResponse.stub(:find) { mock_quiz_response(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(quiz_response_url(mock_quiz_response))
      end
    end

    describe "with invalid params" do
      it "assigns the quiz_response as @quiz_response" do
        QuizResponse.stub(:find) { mock_quiz_response(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:quiz_response).should be(mock_quiz_response)
      end

      it "re-renders the 'edit' template" do
        QuizResponse.stub(:find) { mock_quiz_response(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested quiz_response" do
      QuizResponse.should_receive(:find).with("37") { mock_quiz_response }
      mock_quiz_response.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the quiz_responses list" do
      QuizResponse.stub(:find) { mock_quiz_response }
      delete :destroy, :id => "1"
      response.should redirect_to(quiz_responses_url)
    end
  end

end
