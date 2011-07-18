class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :manage, User, :user_id => user.id
      can :create, Quiz
      can :completado, Quiz
      can :desconocido, Quiz
      can :lista , Course
    end
  end
end
