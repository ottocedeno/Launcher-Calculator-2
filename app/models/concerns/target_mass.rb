module TargetMass
  def assumed_payload_mass
    self.rocket.assumed_payload_mass
  end

  def fairing_jettison_velocity
    self.rocket.fairing_jettison_velocity
  end

  def fairing_mass
    self.rocket.fairing_mass
  end

  def rocket_mass
    self.rocket.rocket_mass
  end

  def max_midsection_diameter
    self.rocket.max_rocket_body_diameter
  end

  def thrust_to_weight_ratio
    self.rocket.thrust_to_weight_ratio
  end

  def second_stage_mass_ratio
    self.rocket.second_stage_to_rocket_mass_ratio
  end

  def third_stage_mass_ratio
    self.rocket.transfer_orbit_stage_to_rocket_mass_ratio
  end

  def first_stage_try_to_wet_mass_ratio
    self.rocket.first_stage_dry_to_wet_mass_ratio
  end

  def second_stage_try_to_wet_mass_ratio
    self.rocket.second_stage_dry_to_wet_mass_ratio
  end

  def first_stage_unused_propellent
    self.rocket.first_stage_unused_propellant
  end
  
  def second_stage_unused_propellent
    self.rocket.second_stage_unused_propellant
  end

  def specific_impulse_variation
    self.rocket.specific_impulse_variation
  end
end