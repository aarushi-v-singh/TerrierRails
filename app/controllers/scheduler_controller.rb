class SchedulerController < ApplicationController
  def index
    @techs = Technician.all
    @locs = Location.all
    @wos = WorkOrder.all

    #TODO ADD TIME/HOURS
    @hours = (0..24)
  end
end
