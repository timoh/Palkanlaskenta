class Addition < ActiveRecord::Base
  belongs_to :employment
  belongs_to :employee
  
  validates_presence_of :title, :date, :sum, :employment_id
  
end
