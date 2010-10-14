class Question < ActiveRecord::Base
  # Helpers
  def to_s
    title
  end
end
