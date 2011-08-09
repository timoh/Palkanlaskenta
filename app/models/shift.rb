class Shift < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employment
end
