class Quiz < ActiveRecord::Base
  # Associations
  has_many :quiz_questions
  has_many :questions, :through => :quiz_questions
  
  # Validations
  validates_presence_of :title
  
  # Helpers
  def to_s
    title
  end
end
