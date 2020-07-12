class MissionsController < ApplicationController
  def index
    if params[:user_id]
      @missions = Mission.where(id: params[:user_id])
    else
      @missions = Mission.all
    end
  end

  def show
  end

  def new
  end
end
