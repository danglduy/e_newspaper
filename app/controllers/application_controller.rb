class ApplicationController < ActionController::Base
  include Pundit::Authorization

  private

  def authenticate_user!
    redirect_to dashboard_login_path unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
