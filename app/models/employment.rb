class Employment < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee
  
  
  
  def print_employment
    "#{self.project.title}"
  end
  
end
