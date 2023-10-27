class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Group, user_id = user.id
    can :manage, Operation, user_id = user.id
  end
end
