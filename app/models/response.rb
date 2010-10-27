# Responses are actual responses to questions.
#
# Responses are built from PossibleAnswer records. To make them less dependent on changes to
# these PossibleAnswers, we duplicate some values.
class Response < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :possible_answer
  belongs_to :question
  belongs_to :answer

  # Validations
  validates_presence_of :possible_answer, :question, :answer, :score

  # Callbacks
  alias set_possible_answer possible_answer=
  def possible_answer=(value)
    set_possible_answer(value)
    self.question = value.question
    self.answer   = value.answer
    self.score    = value.score
  end
  
  def possible_answer_id=(value)
    if PossibleAnswer.exists?(value)
      record = PossibleAnswer.find(value)
      self.possible_answer = record
    else
      self[:possible_answer_id] = value
    end
  end
end
