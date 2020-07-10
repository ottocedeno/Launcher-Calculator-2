class OrbitsController < ApplicationController
  def index
    @orbits = Orbit.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
