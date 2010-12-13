require 'spec_helper'

describe WelcomeController do
  describe "GET 'index'" do
    context "when logged in as admin" do
      login_admin

      it "should redirect to overview#index" do
        get 'index'
        response.should redirect_to(overview_index_path)
      end
    end
  end
end
