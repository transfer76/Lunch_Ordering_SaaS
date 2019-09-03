class MenuPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user
  end

  def show?
    user
  end

  def create?
    user.admin?
  end

  def update?
   create?
  end

  def destroy?
    create?
  end
end
