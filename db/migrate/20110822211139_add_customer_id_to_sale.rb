class AddCustomerIdToSale < ActiveRecord::Migration
  def self.up
    add_column :sales, :customer_id, :integer
  end

  def self.down
    remove_column :sales, :customer_id
  end
end
