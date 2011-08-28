class AddEmployeeIdToAdditions < ActiveRecord::Migration
  def self.up
    add_column :additions, :employee_id, :integer
  end

  def self.down
    remove_column :additions, :employee_id
  end
end
