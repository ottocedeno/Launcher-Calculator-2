class OrbitsController < ApplicationController
  before_action :set_orbit, only: [:show, :new, :edit, :update, :destroy]

  def index
    @orbits = Orbit.all
  end

  def new
  end

  def create
    @orbit = Orbit.new(orbit_params)
    if @orbit.save
      redirect_to orbit_path(@orbit)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @orbit.update(orbit_params)
      redirect_to orbit_path(@orbit)
    else
      render :edit
    end
  end

  def destroy
    @orbit.destroy
    redirect_to orbits_path
  end

  private

  def set_orbit
    @orbit = (Orbit.find_by(id: params[:id]) || Orbit.new)
  end

  def orbit_params
    params.require(:orbit).permit(
      :name,
      :quick_description,
      :orbit_perigee,
      :orbit_apogee,
      :orbit_inclination,
      :orbital_period,
      :delta_v,
      :extra_velocity_to_planets
    )
  end
  
end
