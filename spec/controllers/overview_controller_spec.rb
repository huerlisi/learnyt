require 'spec_helper'

describe OverviewController do
  login_admin
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
