class QuizAssignmentsController < AuthorizedController
  # Scopes
  has_scope :state, :default => 'unsolved'
  
  # Actions
  def show
    @quiz_assignment = QuizAssignment.find(params[:id])
    
    if current_user != @quiz_assignment.user and @quiz_assignment.solved?
      redirect_to @quiz_assignment.quiz_responses.last
    elsif current_user != @quiz_assignment.user
      flash[:notice] = I18n.t('learnyt.quiz.not_solved')
      redirect_to :back
    else
      redirect_to new_quiz_assignment_quiz_response_path(@quiz_assignment)
    end
  end

  def create
    if users = params[:quiz_assignment][:user_ids]
      params[:quiz_assignment].delete(:user_ids)
      users.each do |user|
        params[:quiz_assignment][:user_id] = user
        QuizAssignment.create(params[:quiz_assignment])
      end
      redirect_to quiz_assignments_path
    else
      create!{quiz_assignments_path}
    end
  end

  def update
    update! { quiz_assignments_path }
  end
end
