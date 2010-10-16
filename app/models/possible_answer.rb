class PossibleAnswer < ActiveRecord::Base
  # Associations
  belongs_to :question
  belongs_to :answer
  accepts_nested_attributes_for :answer
end
