class DashboardController < ApplicationController
  def index
    #UserMailer.with(user: @user).welcome_email.deliver_now
    if current_user.Manager?
      @projects = current_user.projects.all
    else
      @projects = current_user.project_enrollment
    end
    
  end
end
