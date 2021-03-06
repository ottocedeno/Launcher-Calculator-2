# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_20_013029) do

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "rocket_id"
    t.integer "spaceport_id"
    t.integer "orbit_id"
    t.boolean "success"
    t.integer "payload_mass"
    t.float "payload_to_lift_off_mass_ratio"
    t.float "payload_change"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orbits", force: :cascade do |t|
    t.string "name"
    t.string "quick_description"
    t.integer "orbit_perigee"
    t.integer "orbit_apogee"
    t.float "orbit_inclination"
    t.float "orbital_period"
    t.float "delta_v"
    t.integer "extra_velocity_to_planets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rockets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "project", default: false
    t.string "first_stage_fuel"
    t.string "first_stage_cycle"
    t.string "second_stage_fuel"
    t.string "second_stage_cycle"
    t.string "third_stage_fuel"
    t.string "third_stage_cycle"
    t.float "thrust_to_weight_ratio"
    t.integer "rocket_mass"
    t.float "max_rocket_body_diameter"
    t.integer "fairing_mass"
    t.integer "fairing_jettison_velocity"
    t.integer "assumed_payload_mass"
    t.float "second_stage_to_rocket_mass_ratio"
    t.float "transfer_orbit_stage_to_rocket_mass_ratio"
    t.float "first_stage_dry_to_wet_mass_ratio"
    t.float "second_stage_dry_to_wet_mass_ratio"
    t.float "transfer_orbit_stage_dry_to_wet_mass_ratio"
    t.float "first_stage_unused_propellant"
    t.float "second_stage_unused_propellant"
    t.float "transfer_orbit_stage_unused_propellant"
    t.integer "first_stage_isp"
    t.integer "first_stage_isp_vacuum"
    t.integer "second_stage_isp"
    t.integer "transfer_orbit_stage_isp"
    t.float "specific_impulse_variation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spaceports", force: :cascade do |t|
    t.string "name"
    t.boolean "air_launch", default: false
    t.float "launch_point_altitude"
    t.float "spaceport_latitude"
    t.float "launch_azimuth"
    t.float "earth_rotation_velocity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "uid"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
