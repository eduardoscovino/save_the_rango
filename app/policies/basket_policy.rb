class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.role == 'Customer' if user
  end

  def checkout?
    user.role == 'Customer' if user
  end
end
