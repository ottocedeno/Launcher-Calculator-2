class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:new]
  before_action :redirect_home_if_logged_in, only: [:new]
  
  def new
    render layout: 'onboarding'
  end

  def create
    @user = User.new(user_params)
    
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, layout: 'onboarding'
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password)
  end
end
