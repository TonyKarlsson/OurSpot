class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where("friend1_id = ? OR friend2_id = ?", user.id, user.id)

    end
  end

  def show?
    record.friend1 == user || record.friend2 == user
    # true
  end
end
