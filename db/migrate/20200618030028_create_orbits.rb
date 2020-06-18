class CreateOrbits < ActiveRecord::Migration[6.0]
  def change
    create_table :orbits do |t|
      t.string :name
      t.string :quick_description
      t.integer :orbit_perigee
      t.integer :orbit_apogee
      t.float :orbit_inclination
      t.float :orbital_period
      t.float :delta_v 
      t.integer :extra_velocity_to_planets

      t.timestamps
    end
  end
end
