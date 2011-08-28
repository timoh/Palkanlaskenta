class RenameEmployeeIdToEmploymentIdInAdditions < ActiveRecord::Migration
  def self.up
    rename_column :additions, :employee_id, :employment_id
  end

  def self.down
    rename_column :additions, :employment_id, :employee_id
  end
end
