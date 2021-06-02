class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.role == 'Customer' || 'admin' if user
  end

  def destroy?
    record.basket.user == user
  end
  
end
