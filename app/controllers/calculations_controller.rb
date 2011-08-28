class CalculationsController < ApplicationController
  
  def index
    
    @employees = Employee.all
    @my_calculation = Employee.find(current_user.employee.id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end