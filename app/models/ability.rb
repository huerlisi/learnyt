# Defines abilities
#
# This class defines the abilities available to User Roles.
# Will be used by CanCan.
class Ability
  # Aspects
  include CanCan::Ability
 
  # Main role/ability definitions.
  def initialize(user)
    user ||= User.new # guest user
 
    alias_action :index, :to => :list
    
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :teacher
      can :manage, :all
    elsif user.role? :pupil
      can :read, [Quiz]
      # manage his own quiz responses
      can :manage, QuizResponse, :user_id => user.id
    end
  end
end
