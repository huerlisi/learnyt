class QuizResponse < ActiveRecord::Base
  # Associations
  belongs_to :quiz
  belongs_to :quiz_assignment
  has_many :responses
  belongs_to :user
  accepts_nested_attributes_for :responses

  # Helpers
  def to_s
    I18n.translate('activerecord.attributes.quiz_response.to_s', :score => "%0.1f" % score, :max_score => "%0.1f" %max_score)
  end

  # Calculated fields
  
  # Calculate overall score.
  #
  # Simply add up the scores for all responses.
  def score
    responses.map{|response| response.score}.inject(:+) || 0.0
  end

  # Calculate maximum score.
  #
  # Simply use the response count * 1.
  def max_score
    responses.count
  end

  # Calculate overall correctness.
  def correctness
    if score == max_score
      return 'correct'
    elsif score == 0.0
      return 'wrong'
    else
      return 'close'
    end
  end
end
