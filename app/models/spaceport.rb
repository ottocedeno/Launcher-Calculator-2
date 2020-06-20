class Spaceport < ApplicationRecord
  has_many :missions

  def additional_velocity
    self.air_launch ? 250 : 0
  end
end
