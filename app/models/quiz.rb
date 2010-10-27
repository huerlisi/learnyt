class Quiz < ActiveRecord::Base
  # Validations
  validates_presence_of :title
  
  # Helpers
  def to_s
    title
  end
end
