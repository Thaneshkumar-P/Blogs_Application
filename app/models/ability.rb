# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all

    can :edit, Post, user_id: user.id
    can :destroy, Post, user_id: user.id
    can :edit, Comment, user_id: user.id
    can :destroy, Comment, user_id: user.id

  end
end
