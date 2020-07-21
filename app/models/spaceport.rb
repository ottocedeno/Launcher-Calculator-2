class Spaceport < ApplicationRecord
  has_many :missions
  has_many :users, through: :missions
  has_many :rockets, through: :missions
  has_many :orbits, through: :missions

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :launch_point_altitude, presence: true
  validates :launch_point_altitude, numericality: {greater_than_or_equal_to: 0}
  validates :spaceport_latitude, presence: true
  validates :spaceport_latitude, numericality: {}
  validates :launch_azimuth, presence: true
  validates :launch_azimuth, numericality: {greater_than_or_equal_to: 0}
  validates :earth_rotation_velocity, presence: true
  validates :earth_rotation_velocity, numericality: {greater_than_or_equal_to: 0}

  def additional_velocity
    self.air_launch ? 250 : 0
  end
end
