class StaticController < ApplicationController
  def home
    @user = User.find(session[:user_id])
  end
end
