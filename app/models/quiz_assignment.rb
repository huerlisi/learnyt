class QuizAssignment < ActiveRecord::Base
  # Scope
  default_scope order(:due_at)
  
  # Associations
  belongs_to :user
  belongs_to :quiz

  # Validations
  validates_presence_of :user, :quiz

  # Calendar
  cattr_reader :start_at_field, :end_at_field
  @@start_at_field = :due_at
  @@end_at_field = :due_at
  
  has_one :event, :dependent => :destroy, :as => :object

  before_save :update_event
  private
  def update_event
    return unless self[self.class.start_at_field]
    build_event unless event
    
    event.start_at = self[self.class.start_at_field]
    event.end_at = self[self.class.end_at_field]
    event.all_day = true
    
    event.save
  end
  
  public
  def name
    to_s
  end

  def all_day
    true
  end
  
  # Helpers
  def to_s
    "%s für %s" % [quiz.title, user.to_s]
  end
end
