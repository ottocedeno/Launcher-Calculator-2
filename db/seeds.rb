# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

otto = {
  username: 'ottocedeno',
  first_name: 'Otto',
  last_name: 'Cedeno',
  password: 'donkey',
  admin: true
}
User.create(otto)

saturn_five = {
  name: "NASA Saturn V",
  description: "Apollo lunar program launcher",
  project: false,

  first_stage_fuel: Stage.fuel[:lox_rp1],
  first_stage_cycle: Stage.cycle[:gas],
  second_stage_fuel: Stage.fuel[:lox_lh2],
  second_stage_cycle: Stage.cycle[:gas],
  third_stage_fuel: Stage.fuel[:lox_lh2],
  third_stage_cycle: Stage.cycle[:gas],

  thrust_to_weight_ratio: 1.165,
  rocket_mass: 2909200,
  max_rocket_body_diameter: 10.1,
  fairing_mass: 8000,
  assumed_payload_mass: 48600,
  second_stage_to_lift_off_mass_ratio: 21.284,
  transfer_orbit_stage_to_lift_off_mass_ratio: 4.228,

  first_stage_dry_to_wet_mass_ratio: 5.677,
  second_stage_try_to_wet_mass_ratio: 8.081,
  transfer_orbit_stage_dry_to_wet_mass_ratio: 10.976,
  first_stage_unused_propellant: 2.6,
  second_stage_unused_propellant: 2.0,
  transfer_orbit_stage_unused_propellant: 2.0,
  first_stage_isp: 263,
  first_stage_isp_vacuum: 304,
  second_stage_isp: 421,
  transfer_orbit_stage_isp: 421,
  specific_impulse_variation: 100.0
}

Rocket.create(saturn_five)

cape_canaveral = {
  name: "Cape Canaveral",
  air_launch: false,
  launch_point_altitude: 0.1,
  spaceport_latitude: 28.5,
  launch_azimuth: 90.00,
  earth_rotation_velocity: 408.6
}

Spaceport.create(cape_canaveral)