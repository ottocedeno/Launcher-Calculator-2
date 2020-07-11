class Orbit < ApplicationRecord
  has_many :missions

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :quick_description, presence: true
  validates :orbit_perigee, presence: true
  validates :orbit_perigee, numericality: {greater_than_or_equal_to: 0}
  validates :orbit_apogee, presence: true
  validates :orbit_apogee, numericality: {greater_than_or_equal_to: 0}
  validates :orbit_inclination, presence: true
  validates :orbit_inclination, numericality: {greater_than_or_equal_to: 0}
  validates :orbital_period, presence: true
  validates :orbital_period, numericality: {greater_than_or_equal_to: 0}
  validates :delta_v, presence: true
  validates :delta_v, numericality: {greater_than_or_equal_to: 0}
  validates :extra_velocity_to_planets, presence: true
  validates :extra_velocity_to_planets, numericality: {greater_than_or_equal_to: 0}

end
