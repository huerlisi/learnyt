class Answer < ActiveRecord::Base
  # Associations
  has_many :possible_answers
  has_many :questions, :through => :possible_questions

  # Validations
  validates_presence_of :title
  
  # Helpers
  def to_s
    title
  end
end
