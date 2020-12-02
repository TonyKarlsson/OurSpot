class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def add_friend?
    user
  end

  def show_profile?
    record.id == user.id
  end

  def accept_friend?
    true
  end

  def reject_friend?
    true
  end

end
