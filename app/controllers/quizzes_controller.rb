class QuizzesController < AuthorizedController
  # Actions
  def show
    @quiz = Quiz.find(params[:id])
    
    if current_user.role?(:pupil)
      redirect_to new_quiz_quiz_response_path(@quiz)
    end
  end
end
