class Employee < ActiveRecord::Base
  has_many :employments
  has_many :sales
  has_many :projects, :through => :employments
  has_many :shifts
  
  validates_presence_of :firstname, :lastname, :minimum_wage, :default_provision
  validates_numericality_of :minimum_wage, :default_provision
  
  
  def print_name
    "#{firstname} #{lastname}"
  end
  
  def total_durations
    tot_dur = 0
    
    self.shifts.each do |shift|
      tot_dur = tot_dur+shift.duration
    end
    
    return tot_dur
  end
  
  def total_salary
    tot_salary = 0
    tot_sales = 0
    tot_shifts = 0
    
    #calculate all sales for employee
    self.sales.each do |sale|
      tot_sales = tot_sales+(sale.sum*sale.employment.provision)
    end
    
    #calculate all wages from shifts, except those that come on top
    self.shifts.each do |shift|
      if (!shift.employment.comes_on_top?)
        tot_shifts = tot_shifts+(shift.duration*shift.employment.hourly_wage)
      end
    end
    
    #select which is greater
    if (tot_shifts >= tot_sales)
      tot_salary = tot_shifts
    else
      tot_salary = tot_sales
    end

    #calculate wages that come on top of the normal salary
    self.shifts.each do |shift|
      if (shift.employment.comes_on_top?)
        tot_salary = tot_salary+(shift.duration*shift.employment.hourly_wage)
      end
    end
    

    return tot_salary
  end
  
  
  
end
