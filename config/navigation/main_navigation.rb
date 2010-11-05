# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|  
  # Define the primary navigation
  navigation.items do |primary|
    # mailyt navigation
    primary.item :overview, t('main_navigation.overview'), root_path
    
    primary.item :nav_quizzes, t_model(Quiz), quizzes_path do |quiz|
      quiz.item :new_quiz, t_action(:new, Quiz), new_quiz_path, :if => lambda { can?(:new, Quiz)}
      quiz.item :quiz_index, t_action(:index, Quiz), quizzes_path
    end

    primary.item :nav_questions, t_model(Question), questions_path, :if => lambda { can?(:new, Question) or can?(:index, Question)} do |question|
      question.item :new_question, t_action(:new, Question), new_question_path, :if => lambda { can?(:new, Question)}
      question.item :question_index, t_action(:index, Question), questions_path, :if => lambda { can?(:index, Question)}
    end

    primary.item :nav_quiz_responses, t_model(QuizResponse), quiz_responses_path do |quiz_response|
      quiz_response.item :new_quiz_response, t_action(:new, QuizResponse), new_quiz_response_path, :if => lambda { can?(:new, QuizResponse)}
      quiz_response.item :quiz_response_index, t_action(:index, QuizResponse), quiz_responses_path
    end

    primary.item :nav_settings, t('main_navigation.settings'), edit_user_registration_path
  end
end
