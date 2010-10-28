class QuizResponse < ActiveRecord::Base
  # Associations
  belongs_to :quiz
  has_many :responses
  accepts_nested_attributes_for :responses
end
