class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def show
  end

  def new
  end
end
