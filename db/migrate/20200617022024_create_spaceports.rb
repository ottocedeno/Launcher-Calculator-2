class CreateSpaceports < ActiveRecord::Migration[6.0]
  def change
    create_table :spaceports do |t|
      t.string :name
      t.boolean :air_launch, default: false
      t.float :launch_point_altitude
      t.float :spaceport_latitude
      t.float :launch_azimuth
      t.float :earth_rotation_velocity

      t.timestamps
    end
  end
end
