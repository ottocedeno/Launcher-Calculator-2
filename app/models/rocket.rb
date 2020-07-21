class Rocket < ApplicationRecord
  include Stage
  has_many :missions
  has_many :users, through: :missions
  has_many :spaceports, through: :missions
  has_many :orbits, through: :missions

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  validates :first_stage_fuel, presence: true
  validates :first_stage_cycle, presence: true
  validates :second_stage_fuel, presence: true
  validates :second_stage_cycle, presence: true

  validates :thrust_to_weight_ratio, presence: true
  validates :thrust_to_weight_ratio, numericality: {greater_than_or_equal_to: 0}
  validates :rocket_mass, presence: true
  validates :rocket_mass, numericality: {greater_than_or_equal_to: 0}
  validates :max_rocket_body_diameter, presence: true
  validates :max_rocket_body_diameter, numericality: {greater_than_or_equal_to: 0}
  validates :fairing_mass, presence: true
  validates :fairing_mass, numericality: {greater_than_or_equal_to: 0}
  validates :fairing_jettison_velocity, presence: true
  validates :fairing_jettison_velocity, numericality: {greater_than_or_equal_to: 0}
  validates :assumed_payload_mass, presence: true
  validates :assumed_payload_mass, numericality: {greater_than_or_equal_to: 0}
  validates :second_stage_to_rocket_mass_ratio, presence: true
  validates :second_stage_to_rocket_mass_ratio, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :transfer_orbit_stage_dry_to_wet_mass_ratio, presence: true
  validates :transfer_orbit_stage_dry_to_wet_mass_ratio, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}

  validates :first_stage_dry_to_wet_mass_ratio, presence: true
  validates :first_stage_dry_to_wet_mass_ratio, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :second_stage_dry_to_wet_mass_ratio, presence: true
  validates :second_stage_dry_to_wet_mass_ratio, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :transfer_orbit_stage_dry_to_wet_mass_ratio, presence: true
  validates :transfer_orbit_stage_dry_to_wet_mass_ratio, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :first_stage_unused_propellant, presence: true
  validates :first_stage_unused_propellant, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :second_stage_unused_propellant, presence: true
  validates :second_stage_unused_propellant, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :transfer_orbit_stage_unused_propellant, presence: true
  validates :transfer_orbit_stage_unused_propellant, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  
  validates :first_stage_isp, presence: true
  validates :first_stage_isp, numericality: {greater_than_or_equal_to: 0}
  validates :first_stage_isp_vacuum, presence: true
  validates :first_stage_isp_vacuum, numericality: {greater_than_or_equal_to: 0}
  validates :second_stage_isp, presence: true
  validates :second_stage_isp, numericality: {greater_than_or_equal_to: 0}
  validates :transfer_orbit_stage_isp, presence: true
  validates :transfer_orbit_stage_isp, numericality: {greater_than_or_equal_to: 0}
  validates :specific_impulse_variation, presence: true
  validates :specific_impulse_variation, numericality: {greater_than_or_equal_to: 0}
  
  
  def stages
    stages = self.attributes.keys.find_all { |k| k.include?('stage_fuel') }
    stages.count { |s| self.send(s) != nil }
  end

  def lift_off_mass
    self.rocket_mass + self.fairing_mass + self.assumed_payload_mass
  end
end
