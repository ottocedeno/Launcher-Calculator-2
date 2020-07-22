class MissionsController < ApplicationController
  before_action :set_mission, only: [:new, :show, :edit, :update, :destroy]

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
    set_mission_options
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.valid?
      @mission.calculate
      redirect_to user_mission_path(@mission.user_id, @mission)
    else
      set_mission_options
      render :new
    end
  end

  def edit
    set_mission_options
  end

  def update
    if @mission.update(mission_params)
      @mission.calculate
      redirect_to user_mission_path(@mission, @mission.user_id)
    else
      set_mission_options
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to user_missions_path(current_user)
  end

  # NON CRUD ACTIONS
  def successful_missions
    @missions = Mission.all_successful_missions
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :user_id, :rocket_id, :spaceport_id, :orbit_id)
  end

  def set_mission
    @mission = (Mission.find_by(id: params[:id]) || Mission.new)
  end

  def set_mission_options
    @rockets = Rocket.all
    @spaceports = Spaceport.all
    @orbits = Orbit.all
  end
end
