class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Group, user.id
    can :manage, Operation, user.id
  end
end
