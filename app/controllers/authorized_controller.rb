class AuthorizedController < InheritedResources::Base
  # Authorization
  authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = t('cancan.access_denied')
    
    if user_signed_in?
      # Show error on referring page for logged in users
      redirect_to :back
    else
      # Redirect to login page otherwise
      redirect_to new_user_session_path
    end
  end

  # Responders
  respond_to :html, :js

  # Resource setup
  protected
    def collection
      instance_eval("@#{controller_name.pluralize} ||= end_of_association_chain.accessible_by(current_ability, :list).paginate(:page => params[:page])")
    end
end
