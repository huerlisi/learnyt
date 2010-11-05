class QuizAssignmentsController < AuthorizedController
  # Actions
  def create
    create! { quiz_assignments_path }
  end

  def update
    update! { quiz_assignments_path }
  end
end
