class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project
  raise Pundit::NotAuthorizedError, "must be logged in" unless User
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, project)
    @user = user
    @project = project
  end


  def create?

    if @user.role =='Manager'
      return true
    end
    false
  end


  def update?
    if @user == @project.creator && @user.role == 'Manager'
      return true
    end
    false
  end

  def edit?
    if @user == @project.creator && @user.role =='Manager'
      return true
    end
    false
  end

  def delete
    if @user == @project.creator && @user.Manager?
      return true
    end
    false
  end


end
