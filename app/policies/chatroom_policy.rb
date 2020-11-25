class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.friend1 == user || record.friend2 == user
    # true
  end
end
