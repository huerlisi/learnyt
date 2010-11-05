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
 
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :teacher
      can :manage, :all
    elsif user.role? :pupil
      can :read, [Quiz, Question]
      # manage products, assets he owns
      can :manage, QuizResponse do |quiz_response|
        quiz_response.try(:user) == user
      end
    end
  end
end
