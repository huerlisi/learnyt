class QuizzesController < AuthorizedController
  # Scopes
  has_scope :tagged_with

  # Actions
  def show
    @quiz = Quiz.find(params[:id])
    
    if current_user.role?(:student)
      redirect_to new_quiz_quiz_response_path(@quiz)
    end
  end
end
