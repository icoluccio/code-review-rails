class RentPolicy < ApplicationPolicy
  def create?
    user.id == record.user.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.includes(:user, :book).where(user: user)
    end
  end
end
