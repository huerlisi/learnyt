class QuizResponsesController < AuthorizedController
  # Associations
  optional_belongs_to :quiz
  
  def create
    params[:quiz_response][:user_id] = current_user.id
    create!
  end
end
