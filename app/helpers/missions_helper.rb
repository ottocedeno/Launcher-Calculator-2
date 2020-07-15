module MissionsHelper
  def ommitted_mission_keys(key)
    ['id', 'name', 'user_id', 'rocket_id', 'spaceport_id', 'orbit_id', 'success', 'created_at', 'updated_at'].include?(key)
  end
end
