class CalculationsController < ApplicationController
  
  def index
    
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end