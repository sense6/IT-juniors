class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new


    can :manage, User, id: user.id
    can :create, Company, id: user.id
    can :manage, Company, id: user.company.id rescue nil
    can :create, JobApplication, id: user.id

    can :read, :all
  end
end
