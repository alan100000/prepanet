class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.student?
      can :manage, :user_id => user.id
    elsif user.administrator?
      can :manage, :all
    end
  end
end
