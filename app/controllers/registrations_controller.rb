class RegistrationsController < Devise::RegistrationsController

  prepend_view_path 'app/views/devise'

  def create
    super
    @user.update_attributes({:locked_at => DateTime.now})
  end

end