class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def show
    
  end
end
