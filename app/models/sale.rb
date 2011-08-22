class Sale < ActiveRecord::Base
  belongs_to :employment
  belongs_to :employee
  belongs_to :customer
  
  validates_presence_of :title, :customer_id, :employment_id, :employee_id, :sum, :order_confirmation
  validates_numericality_of :employment_id, :employee_id, :sum
  
  
end
