class UsersController < AuthorizedController
  def update
    @user = User.find(params[:id])
    
    if params[:user][:password].blank?
      [:password, :password_confirmation, :current_password].collect{|p| params[:user].delete(p) }
    end

    update!
  end
end
