class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || user
  end

  def update?
   user
  end

  def destroy?
    index?
  end
end
