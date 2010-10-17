class Response < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :possible_answer
  has_one :question, :through => :possible_answer
  has_one :answer, :through => :possible_answer

  # Validations
  validates_presence_of :question_id
end
