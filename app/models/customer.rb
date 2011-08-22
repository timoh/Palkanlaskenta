class Customer < ActiveRecord::Base
  has_many :sales
  
  validates_presence_of :name, :contact_person_name, :contact_person_email, :contact_person_phone, :billing_address
  
  
  def print_customer
    "#{self.name} – #{self.contact_person_name}"
  end
  
end
