class DashboardController < ApplicationController
  def index
    #UserMailer.with(user: @user).welcome_email.deliver_now
    if current_user.Manager?
      @projects = current_user.projects.all
      @bug_count = Bug.where(:project=>current_user.projects).count
      @bug_active = Bug.New.or(Bug.Started).where(:project=>current_user.projects).count
      @bug_resolved = Bug.Resolved.where(:project=>current_user.projects).count
      @work_prog = ((@bug_resolved/@bug_active.to_f)*100).to_i
    else
      @projects = current_user.project_enrollment
    end
    
  end
end
