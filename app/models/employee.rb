class Employee < ActiveRecord::Base
  has_many :employments
  has_many :projects, :through => :employments
  has_many :shifts
  
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
  
  
  
end
