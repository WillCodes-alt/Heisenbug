class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:full_name, :email, :password, :role)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:full_name, :email, :password, :current_password, :role)}
  end

  private
  #
  # def user_not_authorized
  # end
end
