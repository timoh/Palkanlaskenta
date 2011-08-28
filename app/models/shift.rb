class Shift < ActiveRecord::Base
  
  by_star_field :start_date
  
  belongs_to :employee
  belongs_to :employment
  
  validates_presence_of :employment_id, :employee_id, :start_date, :start_time, :break_duration, :duration
  validates_numericality_of :employment_id, :employee_id, :break_duration, :duration
  
end
