class Quiz < ActiveRecord::Base
  # Associations
  has_many :quiz_questions, :order => 'position', :dependent => :destroy
  accepts_nested_attributes_for :quiz_questions, :allow_destroy => true
  
  has_many :questions, :through => :quiz_questions, :order => 'position'
  
  # Validations
  validates_presence_of :title
  
  # Helpers
  def to_s
    title
  end
end
