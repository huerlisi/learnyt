require 'spec_helper'

describe ResponsesController do
  login_admin
  
  def mock_response(stubs={})
    @mock_response ||= mock_model(Response, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all responses as @responses" do
      Response.stub(:all) { [mock_response] }
      get :index
      assigns(:responses).should eq([mock_response])
    end
  end

  describe "GET show" do
    it "assigns the requested response as @response" do
      Response.stub(:find).with("37") { mock_response }
      get :show, :id => "37"
      assigns(:response).should be(mock_response)
    end
  end

  describe "GET new" do
    it "assigns a new response as @response" do
      Response.stub(:new) { mock_response }
      get :new
      assigns(:response).should be(mock_response)
    end
  end

  describe "GET edit" do
    it "assigns the requested response as @response" do
      Response.stub(:find).with("37") { mock_response }
      get :edit, :id => "37"
      assigns(:response).should be(mock_response)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created response as @response" do
        Response.stub(:new).with({'these' => 'params'}) { mock_response(:save => true) }
        post :create, :response => {'these' => 'params'}
        assigns(:response).should be(mock_response)
      end

      it "redirects to the created response" do
        Response.stub(:new) { mock_response(:save => true) }
        post :create, :response => {}
        response.should redirect_to(response_url(mock_response))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved response as @response" do
        Response.stub(:new).with({'these' => 'params'}) { mock_response(:save => false) }
        post :create, :response => {'these' => 'params'}
        assigns(:response).should be(mock_response)
      end

      it "re-renders the 'new' template" do
        Response.stub(:new) { mock_response(:save => false) }
        post :create, :response => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested response" do
        Response.should_receive(:find).with("37") { mock_response }
        mock_response.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :response => {'these' => 'params'}
      end

      it "assigns the requested response as @response" do
        Response.stub(:find) { mock_response(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:response).should be(mock_response)
      end

      it "redirects to the response" do
        Response.stub(:find) { mock_response(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(response_url(mock_response))
      end
    end

    describe "with invalid params" do
      it "assigns the response as @response" do
        Response.stub(:find) { mock_response(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:response).should be(mock_response)
      end

      it "re-renders the 'edit' template" do
        Response.stub(:find) { mock_response(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested response" do
      Response.should_receive(:find).with("37") { mock_response }
      mock_response.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the responses list" do
      Response.stub(:find) { mock_response }
      delete :destroy, :id => "1"
      response.should redirect_to(responses_url)
    end
  end

end
