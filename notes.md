# Launcher Calculator 2 TODO

## Models and Associations

Users:

- [x] Has Username
- [x] Has First name
- [x] Has Last name
- [x] Has Admin toggle
- [x] Has Password Encryption
- [x] Has many missions
- [ ] Can sign in with GitHub

Rockets:

- [x] Has a name
- [x] Quick Description
- [x] Project: Boolean, default = false
- [x] 1st stage fuel
- [x] 1st stage cycle
- [x] 2nd stage fuel
- [x] 2nd stage cycle
- [x] 3rd stage fuel, default = false
- [x] 3rd stage cycle, default = false

- [x] #stages => counts stages and returns count
- [x] #lift_off_mass => adds all weight (!!Need to ask Igor about this)

- [x] Thrust-to-weight ratio: float
- [x] Rocket mass: integer
- [x] Max Rocket Body Diameter: float
- [x] Fairing mass: integer
- [x] Assumed payload mass: integer
- [x] 2nd stage to lift-off mass ratio: float
- [x] Transfer Orbit stage to lift-off mass ratio: float
- [x] 1st stage Dry to Wet mass ratio: float
- [x] 2nd stage Dry to Wet mass ratio: float
- [x] Transfer Orbit stage Dry to Wet mass ratio: float
- [x] Unused propellant of 1st stage: float
- [x] Unused propellant of 2nd stage: float
- [x] Unused propellant Transfer Orbit stage: float
- [x] 1st stage Isp sea level or at the start altitude: integer
- [x] 1st stage Isp vacuum: integer
- [x] 2nd stage Isp: integer
- [x] Transfer Orbit stage Isp: integer
- [x] Specific Impulse variation: float
- [x] has many missions

Spaceport:

- [x] Has a name
- [x] Air launch option: Boolean, default: false
- [x] Launch point altitude
- [x] #additional_velocity
- [x] Spaceport Latitude
- [x] Launch Azimuth
- [x] Earth rotation velocity
- [x] has many missions

Orbit:

- [x] Has a name
- [x] Has a Quick Description
- [x] Orbit Perigee
- [x] Orbit Apogee
- [x] Orbit Inclination
- [x] Orbital Period
- [x] Delta-V
- [x] extra_velocity_to_planets
- [x] has many missions

Mission:

- [x] Has a name
- [x] belongs to a user
- [x] belongs to a rocket
- [x] belongs to a spaceport
- [x] belongs to an orbit
- [x] has one mission_result

Mission Result:

- [x] belongs to a mission
- [x] Success: boolean
- [x] Payload Mass
- [x] Payload to Lift-off mass ratio
- [x] Payload change
- [x] Aggression Index
