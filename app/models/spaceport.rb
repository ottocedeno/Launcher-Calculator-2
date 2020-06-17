class Spaceport < ApplicationRecord
  
  def additional_velocity
    self.air_launch ? 250 : 0
  end
end
