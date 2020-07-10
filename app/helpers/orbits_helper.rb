module OrbitsHelper
  def ommitted_orbit_keys(key)
    ['id', 'name', 'quick_description', 'created_at', 'updated_at'].include?(key)
  end
end
