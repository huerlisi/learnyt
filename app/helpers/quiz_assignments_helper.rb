module QuizAssignmentsHelper

  def title(state)
    if !state
      t("learnyt.quiz_assignment.unsolved")
    else
      t("learnyt.quiz_assignment.#{state}")  
    end
  end

end
