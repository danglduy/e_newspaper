# frozen_string_literal: true

class UserPolicy
  attr_reader :user, :target_user

  def initialize(user, target_user)
    @user = user
    @target_user = target_user
  end

  def update?
    user.moderator? || !@target_user.changes.key?(:role)
  end

  def update_role?
    user.moderator?
  end
end
