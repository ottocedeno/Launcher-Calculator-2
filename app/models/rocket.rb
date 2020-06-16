class Rocket < ApplicationRecord
  include Stage

  def stages
    stages = self.attributes.keys.find_all { |k| k.include?('stage_fuel') }
    stages.count { |s| self.send(s) != nil }
  end
end
