class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user

  end

  def destroy?
    record.user == user
  end

 def create?
   return true
 end
end
