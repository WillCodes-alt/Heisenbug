class CommentPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    if @comment.bug.project.enrolled_user.include?(@user) || @comment.bug.project.creator == @user
      return true
    end
    false
  end

  def update?
    if @comment.user == @user || @user.Manager?
      return true
    end
    false
  end

  def delete?
    if @comment.user == @user || @user.Manager?
      return true
    end
    false
  end

end
