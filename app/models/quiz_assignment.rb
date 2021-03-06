class QuizAssignment < ActiveRecord::Base
  # Scope
  default_scope order(:due_at)
  
  # Associations
  belongs_to :user
  belongs_to :quiz
  has_many :quiz_responses
  def response_count
    quiz_responses.count
  end
  
  def solved?
    response_count > 0
  end

  def due?
    due_at ? due_at.past? : false
  end

  def due_today?
    due_at ? due_at.today? : false
  end

  scope :state, lambda {|value|
    if value == 'solved'
      includes(:quiz_responses).where('quiz_responses.created_at IS NOT NULL')
    elsif value == 'unsolved'
      includes(:quiz_responses).where('quiz_responses.created_at IS NULL')
    else
      scoped
    end
  }
  
  # Validations
  validates_presence_of :user, :quiz

  # Calendar
  cattr_reader :start_at_field, :end_at_field
  @@start_at_field = :due_at
  @@end_at_field = :due_at
  
  has_one :event, :dependent => :destroy, :as => :object

  before_save :update_event

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

  private
  def update_event
    return unless self[self.class.start_at_field]
    build_event unless event

    event.user = user
    event.start_at = self[self.class.start_at_field]
    event.end_at = self[self.class.end_at_field]
    event.all_day = true

    event.save
  end
end
