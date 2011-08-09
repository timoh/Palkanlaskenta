class AddCurrentEmployeeToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :current_employee, :boolean
  end

  def self.down
    remove_column :employees, :current_employee
  end
end
