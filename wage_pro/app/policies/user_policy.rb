class UserPolicy < ApplicationPolicy
  def show?
    user.has_role?(:admin) || user.id == record.id
  end
end
