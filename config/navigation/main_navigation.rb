# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|  
  # Define the primary navigation
  navigation.items do |primary|
    # learnyt navigation
    if current_user
      primary.item :overview, t('main_navigation.overview'), root_path
      
      primary.item :nav_quizzes, t_model(Quiz), quizzes_path, :if => lambda { can?(:new, Quiz) or can?(:index, Quiz)}  do |quiz|
        quiz.item :new_quiz, t_action(:new, Quiz), new_quiz_path, :if => lambda { can?(:new, Quiz)}
        quiz.item :quiz_index, t_action(:index, Quiz), quizzes_path, :if => lambda { can?(:index, Quiz)}
      end

      primary.item :nav_quiz_assignments, t_model(QuizAssignment), quiz_assignments_path, :if => lambda { can?(:new, QuizAssignment) or can?(:index, QuizAssignment)} do |quiz_assignment|
        quiz_assignment.item :new_quiz_assignment, t_action(:new, QuizAssignment), new_quiz_assignment_path, :if => lambda { can?(:new, QuizAssignment)}
        quiz_assignment.item :quiz_assignment_index, t_title(:index, QuizAssignment), quiz_assignments_path
        quiz_assignment.item :quiz_assignment_calendar, t_title(:calendar, QuizAssignment), calendar_path
      end

      primary.item :nav_questions, t_model(Question), questions_path, :if => lambda { can?(:new, Question) or can?(:index, Question)} do |question|
        question.item :new_question, t_action(:new, Question), new_question_path, :if => lambda { can?(:new, Question)}
        question.item :question_index, t_action(:index, Question), questions_path, :if => lambda { can?(:index, Question)}
      end

      primary.item :nav_quiz_responses, t_model(QuizResponse), quiz_responses_path, :if => lambda { can?(:new, QuizResponse) } do |quiz_response|
        quiz_response.item :quiz_response_index, t_action(:index, QuizResponse), quiz_responses_path, :if => lambda { can?(:new, QuizResponse) }
      end

      primary.item :nav_users, t_model(User), users_path, :if => lambda { can?(:new, User) or can?(:index, User) } do |user|
        user.item :new_user, t_action(:new, User), new_user_path, :if => lambda { can?(:new, User) }
        user.item :user_index, t_action(:index, User), users_path, :if => lambda { can?(:index, User) }
      end

      primary.item :nav_settings, t('main_navigation.settings'), edit_user_registration_path
    end
  end
end
