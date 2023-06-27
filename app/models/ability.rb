class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, is_hidden: false
    
    return unless user.present?
    can :manage, Comment

    if user.editor?
      can :manage, Post
    end
  end
end
