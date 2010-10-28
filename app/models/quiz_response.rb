class QuizResponse < ActiveRecord::Base
  # Associations
  belongs_to :quiz
  has_many :responses
end
