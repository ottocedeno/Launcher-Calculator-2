class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user

  private

  def set_user
    @user = (current_user || User.new)
  end

  def redirect_home_if_logged_in
    redirect_to root_path if user_is_authenticated
  end

  def require_login
    redirect_to login_path unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
