class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def validate?
    # true
    record.event.user == user
  end

  def create?
    true
  end
end
