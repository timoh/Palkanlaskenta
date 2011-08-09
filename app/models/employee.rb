class Employee < ActiveRecord::Base
  has_many :employments
  has_many :projects, :through => :employments
end
