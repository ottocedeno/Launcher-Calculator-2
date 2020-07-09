class SpaceportsController < ApplicationController
  before_action :set_spaceport, only: [:show, :new]

  def index
    @spaceports = Spaceport.all
  end

  def show
  end

  def new
  end

  def create
    @spaceport = Spaceport.new(spaceport_params)
    if @spaceport.save
      redirect_to spaceport_path(@spaceport)
    else
      render :new
    end
  end

  private
  def set_spaceport
    @spaceport = (Spaceport.find_by(id: params[:id]) || Spaceport.new)
  end

  def spaceport_params
    params.require(:spaceport).permit(
      :name,
      :launch_point_altitude,
      :spaceport_latitude,
      :launch_azimuth,
      :earth_rotation_velocity
    )
  end
end
