module QuizAssignmentsHelper

  def title(state)
    if !state
      t("learnyt.quiz_assignment.unsolved")
    else
      t("learnyt.quiz_assignment.#{state}")  
    end
  end

  def status_of(quiz_assignment)
    quiz = quiz_assignment
    solved = quiz.solved?
    classes = ''
    classes = 'over-due' if quiz.due? and not solved
    classes = 'due-today' if quiz.due_today? and not solved
    classes = classes + ' unsolved' unless solved


    classes
  end
end
