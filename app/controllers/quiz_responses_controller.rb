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

  def archive_action(id, action)
    @quiz_response = QuizResponse.find(id)
    @quiz_response.archive = action
    @quiz_response.save!
  end
  
  # Actions
  public
  def create
    params[:quiz_response][:user_id] = current_user.id
    
    create!
  end

  def archive_index
    @quiz_responses = QuizResponse.archive.paginate :page => params[:page], :order => 'created_at DESC'
    index!
  end

  def archive
    archive_action(params[:quiz_response_id], true)
  end

  def recover
    archive_action(params[:quiz_response_id], false)
  end
end
