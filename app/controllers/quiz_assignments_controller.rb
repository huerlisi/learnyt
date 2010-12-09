class QuizAssignmentsController < AuthorizedController
  # Scopes
  #has_scope :state, :default => 'unsolved'
  
  # Actions
  def show
    @quiz_assignment = QuizAssignment.find(params[:id])
    
    redirect_to new_quiz_assignment_quiz_response_path(@quiz_assignment)
  end

  def create
    create! { quiz_assignments_path }
  end

  def update
    update! { quiz_assignments_path }
  end
end
