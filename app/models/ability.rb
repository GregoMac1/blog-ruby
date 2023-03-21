class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :create, Comment

    if user.editor?
      can :manage, Post
    end
  end
end
