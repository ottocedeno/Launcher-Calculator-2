class RocketsController < ApplicationController
  def index
    @rockets = Rocket.all
  end

  def show
    @rocket = Rocket.find(params[:id])
  end

  def new
    @rocket = Rocket.new
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
  end

  def update
  end

  def destroy
  end

  private
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
