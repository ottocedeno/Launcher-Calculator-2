class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :user_id
      t.integer :rocket_id
      t.integer :spaceport_id
      t.integer :orbit_id
      t.integer :mission_result_id

      t.timestamps
    end
  end
end
