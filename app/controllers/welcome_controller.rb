class WelcomeController < ApplicationController
  def index
    case current_user.role_name
      when 'admin'
        redirect_to overview_index_path
      when 'teacher'
        redirect_to overview_index_path
      when 'student'
        redirect_to quiz_assignments_path
      else
        # Should not happen, actually
        redirect_to overview_index_path
    end
  end
end
