class AddCustomerToSale < ActiveRecord::Migration
  def self.up
    add_column :sales, :customer, :string
  end

  def self.down
    remove_column :sales, :customer
  end
end
