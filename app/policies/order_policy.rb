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

  def add_unit?
    true
  end

  def reduce_unit?
    true
  end
  
end
