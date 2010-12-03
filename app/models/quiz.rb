class Quiz < ActiveRecord::Base
  # Associations
  has_many :quiz_questions, :order => 'position', :dependent => :destroy
  accepts_nested_attributes_for :quiz_questions, :allow_destroy => true
  
  has_many :questions, :through => :quiz_questions, :order => 'position'
  has_many :quiz_responses
  
  has_many :quiz_assignments, :dependent => :destroy
  
  # Validations
  validates_presence_of :title
  
  # Helpers
  def to_s
    title
  end
end
