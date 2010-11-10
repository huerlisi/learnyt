# Defines abilities
#
# This class defines the abilities available to User Roles.
# Will be used by CanCan.
class Ability
  # Aspects
  include CanCan::Ability
 
  # Available roles
  def self.roles
    ['admin', 'pupil', 'teacher']
  end
  
  # Prepare roles to show in select inputs etc.
  def self.roles_for_collection
    self.roles.map{|role| [I18n.translate(role, :scope => 'cancan.roles'), role]}
  end
  
  # Main role/ability definitions.
  def initialize(user)
    user ||= User.new # guest user
 
    alias_action :index, :to => :list
    
    if user.role? :admin
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
