module TargetVelocity
  

  def starting_point_altitude
    self.spaceport.launch_point_altitude
  end

  def orbit_perigee
    self.orbit.orbit_perigee
  end

  def orbit_apogee
    self.orbit.orbit_apogee
  end

  def spaceport_latitude
    self.spaceport.spaceport_latitude
  end

  def orbit_inclination
    self.orbit.orbit_inclination
  end

  def extra_speed_for_flight_to_the_planets
    self.orbit.extra_velocity_to_planets
  end


  def intermediate_angle
    if orbit_inclination.abs > spaceport_latitude.abs
      MyMath.radians_to_degrees(Math.asin(Math.cos(MyMath.degrees_to_radians(orbit_inclination))/Math.cos(MyMath.degrees_to_radians(spaceport_latitude))))
    else
      90 - MyMath.radians_to_degrees(Math.asin(1 - (Math.cos(MyMath.degrees_to_radians(orbit_inclination))/Math.cos(MyMath.degrees_to_radians(spaceport_latitude)))))
    end
  end

  def launch_point_speed
    465 * Math.cos(MyMath.degrees_to_radians(spaceport_latitude))
  end

  def starting_point_altitude_orbital_velocity
    Math.sqrt(MyMath.gravity_constant/(MyMath.earth_radius + starting_point_altitude))
  end

  def absolute_orbital_velocity
    Math.sqrt(MyMath.gravity_constant/(MyMath.earth_radius + orbit_perigee))
  end

  def orbit_apogee_zero?
    orbit_apogee == 0
  end

  def perigee_velocity
    if orbit_apogee_zero?
      1000 * Math.sqrt(398600.5 * (2/(6371 + orbit_perigee) - 1/(6371 + orbit_perigee)))
    else
      1000 * Math.sqrt(398600.5 * (2/(6371 + orbit_perigee) - 1/(6371 + 0.5 * (orbit_perigee + orbit_apogee))))
    end
  end

  def apogee_velocity
    if orbit_apogee_zero?
      perigee_velocity
    else
      1000 * Math.sqrt(398600.5 * (2/(6371 + orbit_apogee) - 1/(6371 + 0.5 * (orbit_perigee + orbit_apogee))))
    end
  end

  def orbital_period
    if orbit_apogee_zero?
      2 * Math::PI/Math.sqrt(398600.5) * (6371 + orbit_perigee)**(3/2)/60
    else
      2 * Math::PI/Math.sqrt(398600.5) * (6371 + 0.5 * (orbit_perigee + orbit_apogee))**(3/2)/60
    end
  end

  def tmp_velocity
    Math.sqrt(launch_point_speed * launch_point_speed + absolute_orbital_velocity * absolute_orbital_velocity - 2 * launch_point_speed * absolute_orbital_velocity * Math.sin(MyMath.degrees_to_radians(intermediate_angle)))
  end

  def orbital_velocity
    465 * Math.cos(MyMath.degrees_to_radians(orbit_inclination)) < absolute_orbital_velocity ? tmp_velocity : -tmp_velocity
  end

  def tmp_velocity_2
    Math.sqrt(launch_point_speed * launch_point_speed + absolute_orbital_velocity * absolute_orbital_velocity - 2 * launch_point_speed * absolute_orbital_velocity * Math.sin(MyMath.degrees_to_radians(intermediate_angle) + 1e-7))
  end

  def orbital_velocity_2
    465 * Math.cos(MyMath.degrees_to_radians(orbit_inclination)) < absolute_orbital_velocity ? tmp_velocity_2 : -tmp_velocity_2
  end

  def orbital_velocity_increment_due_to_the_earth_rotation
    absolute_orbital_velocity - orbital_velocity
  end

  def launch_azimuth_1
    MyMath.radians_to_degrees(Math.acos(absolute_orbital_velocity/orbital_velocity * Math.cos(MyMath.degrees_to_radians(intermediate_angle))))
  end

  def launch_azimuth_2
    MyMath.radians_to_degrees(Math.acos(absolute_orbital_velocity/orbital_velocity * Math.cos(MyMath.degrees_to_radians(intermediate_angle) + 1e-7)))
  end

  def launch_azimuth
    launch_azimuth_1 > launch_azimuth_2 ? -launch_azimuth_1 : launch_azimuth_1
  end

  def absolute_orbital_velocity_2
    absolute_orbital_velocity < 7788.5 ? 7788.5 : absolute_orbital_velocity
  end

  def vsp_for_circular_orbit_2
    starting_point_altitude_orbital_velocity + starting_point_altitude_orbital_velocity * (starting_point_altitude_orbital_velocity/Math.sqrt(0.5 * (starting_point_altitude_orbital_velocity * starting_point_altitude_orbital_velocity + absolute_orbital_velocity_2 * absolute_orbital_velocity_2)) - 1) + absolute_orbital_velocity_2 * (1 - absolute_orbital_velocity_2/Math.sqrt(0.5 * (starting_point_altitude_orbital_velocity * starting_point_altitude_orbital_velocity + absolute_orbital_velocity_2 * absolute_orbital_velocity_2)))
  end

  def irremovable_gravity_losses
    - 242.5 + vsp_for_circular_orbit_2 - absolute_orbital_velocity_2
  end

  def vsp_for_circular_orbit
    starting_point_altitude_orbital_velocity + starting_point_altitude_orbital_velocity * (starting_point_altitude_orbital_velocity/Math.sqrt(0.5 * (starting_point_altitude_orbital_velocity * starting_point_altitude_orbital_velocity + absolute_orbital_velocity * absolute_orbital_velocity)) - 1) + absolute_orbital_velocity * (1 - absolute_orbital_velocity/Math.sqrt(0.5 * (starting_point_altitude_orbital_velocity * starting_point_altitude_orbital_velocity + absolute_orbital_velocity * absolute_orbital_velocity))) - orbital_velocity_increment_due_to_the_earth_rotation
  end

  def vsp_for_target_orbit
    if orbit_apogee_zero?
      vsp_for_circular_orbit + extra_speed_for_flight_to_the_planets
    else
      vsp_for_circular_orbit + extra_speed_for_flight_to_the_planets + absolute_orbital_velocity * (absolute_orbital_velocity/Math.sqrt(0.5 * (absolute_orbital_velocity * absolute_orbital_velocity + MyMath.gravity_constant/(MyMath.earth_radius + orbit_apogee))) - 1)
    end
  end

  def injection_velocity
    vsp_for_target_orbit + orbital_velocity_increment_due_to_the_earth_rotation
  end

  def vsp_for_leo
    8031 - orbital_velocity_increment_due_to_the_earth_rotation
  end

end