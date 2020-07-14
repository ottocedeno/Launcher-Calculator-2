class MissionsController < ApplicationController
  before_action :set_mission, only: [:new, :edit, :update]

  def index
    if params[:user_id]
      @missions = Mission.where(user_id: params[:user_id])
    else
      @missions = Mission.all
    end
  end

  def show
  end

  def new
    load_mission_options
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.valid?
      #@mission.mission_result = MissionResult.calculate
      @mission.save
      redirect_to user_mission_path(@mission, @mission.user_id)
    else
      load_mission_options
      render :new
    end
  end

  def edit
    load_mission_options
  end

  def update
    if @mission.update(mission_params)
      redirect_to user_mission_path(@mission, @mission.user_id)
    else
      load_mission_options
      render :edit
    end
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :user_id, :rocket_id, :spaceport_id, :orbit_id)
  end

  def set_mission
    @mission = (Mission.find_by(id: params[:id]) || Mission.new)
  end

  def load_mission_options
    @rockets = Rocket.all
    @spaceports = Spaceport.all
    @orbits = Orbit.all
  end
end
