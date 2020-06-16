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
  transfer_orbit_stage_to_lift_off_mass_ratio: 4.228
}

Rocket.create(saturn_five)