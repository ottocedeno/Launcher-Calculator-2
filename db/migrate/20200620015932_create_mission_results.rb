class CreateMissionResults < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_results do |t|
      t.integer :mission_id
      t.boolean :success
      t.integer :payload_mass
      t.float :payload_to_lift_off_mass_ratio
      t.float :payload_change
      t.float :aggression_index

      t.timestamps
    end
  end
end
