class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, User, id: user.id
    can :manage, Company, id: user.company.id

    can :read, :all
  end
end
