module SpaceportsHelper
  def ommitted_spaceport_keys(key)
    ['id', 'name', 'air_launch', 'created_at', 'updated_at'].include?(key)
  end
end
