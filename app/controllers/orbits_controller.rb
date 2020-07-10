class OrbitsController < ApplicationController
  before_action :set_orbit, only: [:show]
  
  def index
    @orbits = Orbit.all
  end

  def new
  end

  def show
  end

  def edit
  end

  private

  def set_orbit
    @orbit = (Orbit.find_by(id: params[:id]) || Orbit.new)
  end
end
