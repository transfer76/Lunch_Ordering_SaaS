class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  def show?
    index?
  end

  def create?
    user.admin? || user
  end

  def update?
   create?
  end

  def destroy?
    create?
  end
end
