class ResponsesController < AuthorizedController
  # Associations
  optional_belongs_to :question
end
