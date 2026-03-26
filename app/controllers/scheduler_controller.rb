class SchedulerController < ApplicationController
  def index
    @techs = Technician.all
    all_wos = WorkOrder.includes(:location).sort_by(&:time) #EFFICENT SEARCH FUNC

    # Hashtable of work orders by tech ID
    @wos_by_tech = all_wos.group_by(&:technician_id)

    # header date cuz why not
    @schedule_date = all_wos.first&.time&.strftime("%B %d, %Y")
  end
end