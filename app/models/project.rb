class Project < ActiveRecord::Base
  has_many :employments
  has_many :employees, :through => :employments
  
  validates_presence_of :title, :project_start, :project_end
  
  def print_project
    "#{title}"
  end
end
