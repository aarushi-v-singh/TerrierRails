class TechnicianController < ApplicationController 
  #get all techs
  def index
    @techs = Technician.all
  end

end