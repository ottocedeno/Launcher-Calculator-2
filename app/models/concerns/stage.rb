module Stage

  @@fuel = {
    lox_rp1: "Lox/Kerosene",
    lox_methane: "Lox/Methane",
    lox_lh2: "Lox/LH2",
    mono: "Monopropellant",
    solid: "Solid"
  }

  @@cycle = {
    staged: "Staged Combustion",
    gas: "Gas-Generator",
    electric: "Electric",
    pressure: "Pressure Fed"
  }

  def self.fuel
    @@fuel
  end

  def self.cycle
    @@cycle
  end
end