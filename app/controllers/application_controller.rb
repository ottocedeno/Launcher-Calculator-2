class ApplicationController < ActionController::Base

  def set_user
    @user = User.new
  end
end
