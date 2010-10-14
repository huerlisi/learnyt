class PossibleAnswer < ActiveRecord::Base
  # Associations
  belongs_to :question
  belongs_to :answer
end
