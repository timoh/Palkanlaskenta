class Project < ActiveRecord::Base
  has_many :employments
  has_many :employees, :through => :employments
  
  def print_project
    "#{title}"
  end
end
