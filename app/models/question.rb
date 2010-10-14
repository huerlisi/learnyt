class Question < ActiveRecord::Base
  # Associations
  has_many :possible_answers
  has_many :answers, :through => :possible_questions

  # Helpers
  def to_s
    title
  end
end
