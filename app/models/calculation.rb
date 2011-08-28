class Calculation #< ActiveRecord::Base
  validates_presence_of :title, :date, :sum, :employment_id
  

end
