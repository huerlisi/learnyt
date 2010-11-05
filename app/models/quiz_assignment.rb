class QuizAssignment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :quiz
end
