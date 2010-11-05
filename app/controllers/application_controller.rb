class ApplicationController < ActionController::Base
  protect_from_forgery

  authorize_resource
end
