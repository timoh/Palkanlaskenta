class Sale < ActiveRecord::Base
  belongs_to :employment
  belongs_to :employee
end
