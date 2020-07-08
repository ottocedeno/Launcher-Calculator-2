class SpaceportsController < ApplicationController
  # before_action :set_spaceport, only: []

  def index
    @spaceports = Spaceport.all
  end

  private
  def set_spaceport
    @spaceport = (Spaceport.find_by(id: params[:id]) || Spaceport.new)
  end
end
