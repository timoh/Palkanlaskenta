class Payment < ActiveRecord::Base
  
  belongs_to :employee
  validates_presence_of :employee_id, :payment_date, :sum
  
  
end
