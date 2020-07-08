class RocketsController < ApplicationController
  before_action :set_rocket, only: [:show, :new, :edit, :update, :destroy]
  def index
    @rockets = Rocket.all
  end

  def show
  end

  def new
    load_stages
  end

  def create
    @rocket = Rocket.new(rocket_params)
    if @rocket.valid?
      @rocket.save
      redirect_to rocket_path(@rocket)
    else
      load_stages
      render :new
    end
  end

  def edit
    load_stages
  end

  def update
    if @rocket.update(rocket_params)
      redirect_to rocket_path(@rocket)
    else
      load_stages
      render :edit
    end
  end

  def destroy
    @rocket.destroy
    redirect_to rockets_path
  end

  private

  def set_rocket
    @rocket = (Rocket.find_by(id: params[:id]) || Rocket.new)
  end

  def rocket_params
    params.require(:rocket).permit(
      :name,
      :description,
      :project,
      :first_stage_fuel,
      :first_stage_cycle,
      :second_stage_fuel,
      :second_stage_cycle,
      :third_stage_fuel,
      :third_stage_cycle,
      :thrust_to_weight_ratio,
      :rocket_mass,
      :max_rocket_body_diameter,
      :fairing_mass,
      :assumed_payload_mass,
      :second_stage_to_rocket_mass_ratio,
      :transfer_orbit_stage_to_rocket_mass_ratio,
      :first_stage_dry_to_wet_mass_ratio,
      :second_stage_dry_to_wet_mass_ratio,
      :transfer_orbit_stage_dry_to_wet_mass_ratio,
      :first_stage_unused_propellant,
      :second_stage_unused_propellant,
      :transfer_orbit_stage_unused_propellant,
      :first_stage_isp,
      :first_stage_isp_vacuum,
      :second_stage_isp,
      :transfer_orbit_stage_isp,
      :specific_impulse_variation
    )
  end

  def load_stages
    @fuels = Stage.fuel.values
    @cycles = Stage.cycle.values
  end
end
