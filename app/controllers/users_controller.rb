class UsersController < ApplicationController
  before_action :set_user, only: [:new]

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password)
  end
end
