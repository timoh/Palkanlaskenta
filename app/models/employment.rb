class Employment < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee
  
  
  
  def print_employment
    "#{self.project.title}, #{self.employee.firstname } #{self.employee.lastname}"
  end
  
end
