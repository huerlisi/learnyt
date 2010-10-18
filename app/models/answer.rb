class Answer < ActiveRecord::Base
  # Associations
  has_many :possible_answers
  has_many :questions, :through => :possible_questions

  # Validations
  validates_presence_of :title
  
  # Scopes
  scope :by_title, lambda {|value| where("title LIKE ?", "%#{value}%")}
  
  # Helpers
  def to_s
    title
  end
end
