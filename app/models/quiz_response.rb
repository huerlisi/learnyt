class QuizResponse < ActiveRecord::Base
  # Associations
  belongs_to :quiz
  has_many :responses
  accepts_nested_attributes_for :responses

  # Helpers
  def to_s
    "%0.1f out of %0.1f points" % [score, max_score]
  end

  # Calculated fields
  
  # Calculate overal score.
  #
  # Simply add up the scores for all responses.
  def score
    responses.map{|response| response.score}.inject(:+)
  end

  # Calculate maximum score.
  #
  # Simply use the response count * 1.
  def max_score
    responses.count
  end
end
