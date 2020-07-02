class CreateRockets < ActiveRecord::Migration[6.0]
  def change
    create_table :rockets do |t|
      t.string :name
      t.string :description
      t.boolean :project, default: false
      t.string :first_stage_fuel
      t.string :first_stage_cycle
      t.string :second_stage_fuel
      t.string :second_stage_cycle
      t.string :third_stage_fuel
      t.string :third_stage_cycle
      t.float :thrust_to_weight_ratio
      t.integer :rocket_mass
      t.float :max_rocket_body_diameter
      t.integer :fairing_mass
      t.integer :assumed_payload_mass
      t.float :second_stage_to_rocket_mass_ratio
      t.float :transfer_orbit_stage_to_rocket_mass_ratio
      t.float :first_stage_dry_to_wet_mass_ratio
      t.float :second_stage_dry_to_wet_mass_ratio
      t.float :transfer_orbit_stage_dry_to_wet_mass_ratio
      t.float :first_stage_unused_propellant
      t.float :second_stage_unused_propellant
      t.float :transfer_orbit_stage_unused_propellant
      t.integer :first_stage_isp
      t.integer :first_stage_isp_vacuum
      t.integer :second_stage_isp
      t.integer :transfer_orbit_stage_isp
      t.float :specific_impulse_variation
      t.timestamps
    end
  end
end
