class AddEmployeeIdToPayment < ActiveRecord::Migration
  def self.up
    add_column :payments, :employee_id, :integer
  end

  def self.down
    remove_column :payments, :employee_id
  end
end
