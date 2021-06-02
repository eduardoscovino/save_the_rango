class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.role == 'Customer' || 'admin' if user
  end

  def checkout?
    user.role == 'Customer' || 'admin' if user
  end
end
