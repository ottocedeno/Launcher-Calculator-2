module MyMath

  def self.earth_radius
    6371
  end

  def self.gravity_constant
    398600500000
  end

  def self.radians_to_degrees(radians)
    radians * (180/Math::PI)
  end

  def self.degrees_to_radians(degrees)
    degrees * (Math::PI/180)
  end

end