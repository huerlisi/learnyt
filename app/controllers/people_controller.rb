# People Controller
#
# Provides a person management interface.
class PeopleController < AuthorizedController
  # Scopes
  has_scope :tagged_with
end
