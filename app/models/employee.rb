class Employee < ActiveRecord::Base
  has_many :employments
  has_many :projects, :through => :employments
  
  def print_name
    "#{firstname} #{lastname}"
  end
  
  
  
end
