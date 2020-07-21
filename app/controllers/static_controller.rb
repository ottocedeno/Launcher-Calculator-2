class StaticController < ApplicationController
  before_action :set_user, only: [:home]
  
  def home
  end

  def about
  end
end
