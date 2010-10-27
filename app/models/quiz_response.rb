class QuizResponse < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :response

  has_one :user, :through => :response
end
