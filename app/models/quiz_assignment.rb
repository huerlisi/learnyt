class QuizAssignment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :quiz

  # Validations
  validates_presence_of :user, :quiz
end
