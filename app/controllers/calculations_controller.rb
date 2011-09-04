class CalculationsController < ApplicationController
  helper_method :employee_included?

  def index
    
    @employees = Employee.order("lastname asc")
    @my_calculation = Employee.find(current_user.employee.id)
    
    @months_with_shifts = months_with_shifts 

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def show
    @employees = Employee.all
    
    @months_with_shifts = months_with_shifts 
    
    year = params[:year].to_i
    month = params[:month].to_i
    @shifts = Shift.by_year(year).by_month(month)
    
  end
  
  private
  
  def employee_included?(employee, shifts)
    included = false
    shifts.each do |shift|
      if shift.employee.id == employee.id
        included = true
      end
    end  
      
    included  
  end
  
  def months_with_shifts
    mws = {}
    
    for year in 1999..2020
      if (Shift.by_year(year).count > 0)
        for month in 1..12
          if (Shift.by_month(month).count > 0)
            mws[year] ||= []
            mws[year] << month
          end
        end
      end
    end
    mws
    
  end
  
end