class StaticController < ApplicationController
  def home
    raise session[:user_id].inspect
  end
end
