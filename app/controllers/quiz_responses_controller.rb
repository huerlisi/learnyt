class QuizResponsesController < AuthorizedController
  # Associations
  optional_belongs_to :quiz
  optional_belongs_to :quiz_assignment
  
  # Filters
  private
  before_filter :set_quiz
  def set_quiz
    @quiz = QuizAssignment.find(params[:quiz_assignment_id]).quiz if params[:quiz_assignment_id]
  end
  
  # Actions
  public
  def create
    params[:quiz_response][:user_id] = current_user.id
    
    create!
  end
end
