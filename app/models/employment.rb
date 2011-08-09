class Employment < ActiveRecord::Base
  belongs_to :employment
  belongs_to :employee
end
