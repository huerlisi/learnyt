class QuizAssignment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :quiz

  # Validations
  validates_presence_of :user, :quiz

  # Calendar
  has_event_calendar :start_at_field  => 'due_at', :end_at_field => 'due_at'
  
  def name
    to_s
  end

  def all_day
    true
  end
  
  # Helpers
  def to_s
    user.to_s
  end
end
