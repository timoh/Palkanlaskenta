class Employment < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee
  has_many :sales
  has_many :additions
  
  validates_presence_of :employee_id, :project_id, :hourly_wage, :provision
  validates_numericality_of :hourly_wage, :provision, :employee_id, :project_id
  
  def print_employment
    "#{self.project.title}, #{self.employee.firstname } #{self.employee.lastname}"
  end
  
end
