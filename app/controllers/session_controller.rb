class SessionController < ApplicationController
  before_action :set_user, only: [:new]

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      login_error
      render 'new'
    end
  end

  private
  def login_error
    set_user
    @user.errors.add(:login_credentials, "Username and Password do not match")
  end
end