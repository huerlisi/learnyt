class AnswersController < AuthorizedController
  # Responders
  respond_to :html, :js, :json

  # Scopes
  has_scope :by_title
end
