class RolesPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :role, :polymorphic => true
end
