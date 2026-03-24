class LocationController < ApplicationController
  #get all locations
  def index
    @locs = Location.all
  end
end