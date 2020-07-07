module RocketsHelper
  def ommitted_rocket_keys(key)
    ['id', 'name', 'description', 'project', 'created_at', 'updated_at'].include?(key)
  end
end
