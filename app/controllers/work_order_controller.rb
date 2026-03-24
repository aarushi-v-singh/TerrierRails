class WorkOrderController < ApplicationController
  #get all workorders
  def index
    @wos = Work_order.all
  end

  #add new workorder
  def new
    @subject = Subject.new
  end

end
