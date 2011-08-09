class Sale < ActiveRecord::Base
  belongs_to :employment
  belongs_to :employee
  
  validates_presence_of :title, :employment_id, :employee_id, :sum
  validates_numericality_of :employment_id, :employee_id, :sum
  
  
end
