class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :manage, User, :user_id => user.id
    end
  end
end
