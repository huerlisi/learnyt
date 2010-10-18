class Question < ActiveRecord::Base
  # Associations
  has_many :possible_answers, :order => :position
  accepts_nested_attributes_for :possible_answers, :allow_destroy => true
  
  has_many :answers, :through => :possible_answers
  accepts_nested_attributes_for :answers

  has_many :responses
  
  # Validations
  validates_presence_of :title
  
  # Scopes
  scope :by_title, lambda {|value| where("title LIKE ?", "%#{value}%")}
  
  # Helpers
  def to_s
    title
  end
end
