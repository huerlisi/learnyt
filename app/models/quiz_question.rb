class QuizQuestion < ActiveRecord::Base
  # Associations
  belongs_to :quiz
  belongs_to :question
  
  # Validations
  validates_presence_of :question, :position
end
