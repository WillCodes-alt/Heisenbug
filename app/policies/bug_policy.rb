class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def new?
    if @user.Quality? && @user.project_enrollment.include?(@bug.project)
      return true
    end
    false
  end
  def create?
    if @user.Quality? && @user.project_enrollment.include?(@bug.project)
      return true
    end
    false
  end
  def edit?
    return true if @bug.posted_by == @user
    false
  end
  def update?
    if  (@user.Developer? && @user.project_enrollment.include?(@bug.project)) || @bug.posted_by == @user
      return true
    end
    false
  end

  # @return [Object]
  def delete?
    if @bug.posted_by == @user
      return true
    end
    false
  end

end
