class AnswersController < AuthorizedController
  # Responders
  respond_to :html, :js, :json

  # Scopes
  has_scope :by_title
  has_scope :tagged_with
end
