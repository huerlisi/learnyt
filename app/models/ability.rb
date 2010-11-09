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
      can :manage, [Answer, PossibleAnswer, Quiz, QuizQuestion, QuizAssignment, QuizResponse, Question]
    elsif user.role? :pupil
      can :list, Quiz
      can :list, QuizAssignment, :user_id => user.id
      # manage his own quiz responses
      can :manage, QuizResponse, :user_id => user.id
    end
  end
end
