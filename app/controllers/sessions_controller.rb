class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:new]
  before_action :redirect_home_if_logged_in, only: [:new]

  def new
  end

  def create
    if auth
      authenticate_via_github
      successful_login
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        successful_login
      else
        login_error
        render 'new'
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def successful_login
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def login_error
    set_user
    @user.errors.add(:login_error, "Username and Password do not match")
  end

  #-----Github Login Flow Private Methods-----#
  def auth
    request.env['omniauth.auth']
  end

  def authenticate_via_github
    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.username = set_username_from_github
      u.first_name = set_name_from_github[:first_name]
      u.last_name = set_name_from_github[:last_name]
      u.password = SecureRandom.hex(16)
    end
  end

  def set_username_from_github
    if User.find_by(username: auth[:info][:nickname])
      auth[:info][:nickname] + SecureRandom.alphanumeric(4)
    else
      auth[:info][:nickname]
    end
  end

  def set_name_from_github
    first_name, last_name = auth[:info][:name].split(" ")
    {first_name: first_name, last_name: last_name}
  end
end