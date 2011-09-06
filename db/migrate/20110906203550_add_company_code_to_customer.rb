class AddCompanyCodeToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :company_code, :string
  end

  def self.down
    remove_column :customers, :company_code
  end
end
