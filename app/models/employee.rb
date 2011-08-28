class Employee < ActiveRecord::Base
  has_many :employments
  has_many :sales
  has_many :projects, :through => :employments
  has_many :shifts
  has_many :additions
  has_many :sales
  
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
  
  def provision_subtotal
    prov_subtotal = 0
    self.sales.each do |sale|
      prov_subtotal = prov_subtotal+(sale.sum*sale.employment.provision) 
    end
    
    prov_subtotal
  end
  
  def additionals_subtotal
    addit_subtotal = 0
    self.additions.each do |addition|
      addit_subtotal = addit_subtotal+addition.sum
    end
    
    addit_subtotal
    
  end
  
  def shifts_not_on_top_subtotal
    snot_subtotal = 0
    
    self.shifts.each do |shift|
      if (!shift.employment.comes_on_top?)
        snot_subtotal = snot_subtotal+(shift.duration*shift.employment.hourly_wage)
      end
    end
    
    snot_subtotal
  end
  
  def shifts_on_top_subtotal
    sot_subtotal = 0
    self.shifts.each do |shift|
      if (shift.employment.comes_on_top?)
        sot_subtotal = sot_subtotal+(shift.duration*shift.employment.hourly_wage)
      end
    end
    
    sot_subtotal
  end
  
  
  def total_salary
    tot_salary = 0
    
    #calculate provision from sales
    tot_salary = tot_salary+self.provision_subtotal
    
    #calculate all wages from shifts, except those that come on top
    tot_salary = tot_salary+self.shifts_not_on_top_subtotal
    
    #select should base salary or provision be paid
    if (self.shifts_not_on_top_subtotal >= self.provision_subtotal)
      tot_salary = self.shifts_not_on_top_subtotal
    else
      tot_salary = self.provision_subtotal
    end
    
    #add wages that come on top of the base salary
    tot_salary = tot_salary+self.shifts_on_top_subtotal
    tot_salary = tot_salary+self.additionals_subtotal
    

    return tot_salary
  end
  
  
  
end
