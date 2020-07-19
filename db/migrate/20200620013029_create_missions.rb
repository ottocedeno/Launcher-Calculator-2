class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :user_id
      t.integer :rocket_id
      t.integer :spaceport_id
      t.integer :orbit_id

      t.boolean :success
      t.integer :payload_mass
      t.float :payload_to_lift_off_mass_ratio
      t.float :payload_change

      t.timestamps
    end
  end
end
