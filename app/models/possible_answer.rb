class PossibleAnswer < ActiveRecord::Base
  # Associations
  belongs_to :question
  belongs_to :answer
  accepts_nested_attributes_for :answer

  # Helpers
  def correctness
    if score == 1.0
      return 'correct'
    elsif score == 0.0
      return 'wrong'
    else
      return 'close'
    end
  end
end
