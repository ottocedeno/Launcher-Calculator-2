class Rocket < ApplicationRecord
  include Stage
  has_many :missions

  def stages
    stages = self.attributes.keys.find_all { |k| k.include?('stage_fuel') }
    stages.count { |s| self.send(s) != nil }
  end

  def lift_off_mass
    self.rocket_mass + self.fairing_mass + self.assumed_payload_mass
  end
end
