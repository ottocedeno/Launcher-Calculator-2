# Launcher Calculator 2 TODO

## Models and Associations

Users:

- [x] Has Username
- [x] Has First name
- [x] Has Last name
- [x] Has Admin toggle
- [x] Has Password Encryption
- [x] Has many missions

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

## Login / Sign Up Flow

### Login

- [x] /login responds with 200 status
- [x] /login routes to session controller
- [x] Can sign in with an existing UN / PW
- [x] session is set
- [x] if pw not authenticated, re-render login form

### Github Login

- [x] Can sign in with GitHub
- [x] Creates a new random temporary UN if UN already exists

### SignUp

- [x] has a sign up form
- [x] has a link to the login page

### SignUp Validations

- [x] username must be unique
- [x] username must be present
- [x] first/last name must be present
- [x] password must be present
- [x] display alerts if validation issues

### Access and Authorization

- [x] Lock homepage unless user is logged in
- [x] If user logged in, redirect /login to home
- [x] If user logged in, redirect /signup to home

### Logout

- [x] /logout logs user out and clears session
- [x] redirects to /login page

## Views

### Home

- [x] Can only be viewed if logged in
- [x] Has a nav bar
- [x] nav bar has links to areas of the application including logging out
- [ ] Has tiles to the main actions: Start a Mission, View Resources

### Rocket

Index:

- [x] Has a title and description
- [x] Has a button to create a new rocket ONLY BY ADMIN
- [x] Lists each rocket
- [x] Each rocket has an Edit Rocket button ONLY BY ADMIN
- [ ] Each rocket has a Start Mission that links to users/:id/mission/new
- [x] Each Rocket has a link to it's show page

Show:

- [x] Shows name and description
- [x] Has a table that shows the rocket stats

### Spaceports

Index:

- [x] Has a title
- [ ] Has a button to create a new spaceport ONLY BY ADMIN
- [x] Lists each Spaceport
- [x] Each spaceport has an Edit Spaceport button ONLY BY ADMIN
- [ ] Each Spaceport has a Start Mission that links to users/:id/mission/new
- [x] Each Spaceport has a link to it's show page

Show:

- [x] Shows name
- [x] Has a table that shows the spaceport stats

### Orbits

Index:

- [x] Has a title
- [x] Has a button to create a new spaceport ONLY BY ADMIN
- [x] Lists each Orbit
- [x] Each Orbit has an Edit Orbit button ONLY BY ADMIN
- [ ] Each Orbit has a Start Mission that links to users/:id/mission/new
- [x] Each Orbit has a link to it's show page

Show:

- [x] Shows name
- [x] Has a table that shows the orbit stats

### Home

- [ ] Welcomes user
- [ ] Quick intro
- [ ] List of latest missions from all users
- [ ] Button to start a mission
- [ ] 3 columns: Rocket, Orbit and Spaceport View tiles

### My Mission

- [x] Nested route users/:id/missions
- [x] Has a button to create a new mission
- [x] Has tiles to show all missions by that user only
- [x] Has a button to edit if current user owns that mission
- [x] Each tile has a link to the results of that mission

### Mission View

- [x] Has mission name
- [x] Shows which R, O, and SP
- [ ] has a delete button
- [ ] shows a success or failure
- [ ] Shows a table of mission results

### About

- [x] Shows info from current Launcher Calc website

## Features

### Create Rocket

- [x] Nested route /admin/rockets/new
- [x] Has drop downs that add in fuels and cycles
- [x] 3rd stage is optional
- [ ] Successful creation redirects to rocket/:id
- [ ] Successful creation shows success alert
- [x] Shows errors when present

### Edit Rocket

- [x] Reuses form partial
- [x] Only updates if the data is valid

### Validate Create/Edit Rocket forms

- [x] Add presence, uniqueness, and numericality where appropriate

### Delete Rocket

- [x] Show view has a button to delete
- [x] Button only visable to admin
- [ ] Only logged in user who is admin can access this route

### Create Spaceport

- [x] Nested route /admin/spaceport/new
- [x] Successful creation redirects to spaceport/:id
- [ ] Successful creation shows success alert
- [x] Shows errors when present

### Edit Spaceport

- [x] Reuses form partial
- [x] Only updates if the data is valid
- [ ] Shows update was successful

### Delete Spaceport

- [x] Show view has a button to delete
- [x] Button only visable to admin
- [ ] Only logged in user who is admin can access this route

### Validate Create/Edit Spaceport forms

- [x] Add presence, uniqueness, and numericality where appropriate

### Create Orbit

- [x] Nested route /admin/orbit/new
- [x] Successful creation redirects to orbit/:id
- [ ] Successful creation shows success alert
- [ ] Shows errors when present

### Edit Orbit

- [x] Reuses form partial
- [x] Only updates if the data is valid

### Validate Create/Edit Orbit forms

- [x] Add presence, uniqueness, and numericality where appropriate

### Delete Orbit

- [x] Show view has a button to delete
- [x] Button only visible to admin
- [ ] Only logged in user who is admin can access this route

### Create Mission

- [x] Has drop downs for rocket, orbit and spaceport

## Edit Mission

- [x] Reuses form partial
- [x] Only updates if the data is valid

### Delete Mission

- [x] Show view has a button to delete
- [x] Successfully deletes mission

### Validate Create/Edit Mission forms

- [x] Add presence
