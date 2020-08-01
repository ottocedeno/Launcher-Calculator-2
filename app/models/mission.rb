class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :rocket
  belongs_to :spaceport
  belongs_to :orbit

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :all_successful_missions, -> {where(success: true)}

  # def self.all_successful_missions
  #   self.where(success: true)
  # end

  def calculate
    update_payload_mass
    update_mission_stats
  end

  private

  def update_payload_mass
    self.update(payload_mass: random_mass_calculator)
  end
  
  def update_mission_stats
    self.update(
      success: set_success,
      payload_to_lift_off_mass_ratio: set_lift_off_mass_ratio,
      payload_change: set_payload_change
    )
  end

  def random_mass_calculator
    rand(-10000..150000)
  end

  def set_success
    payload_mass > 0 ? true : false
  end

  def set_lift_off_mass_ratio
    ((payload_mass.to_f / rocket.lift_off_mass.to_f) * 100).truncate(2)
  end

  def set_payload_change
    ((payload_mass.to_f / rocket.assumed_payload_mass.to_f) * 100).truncate(2)
  end

end
