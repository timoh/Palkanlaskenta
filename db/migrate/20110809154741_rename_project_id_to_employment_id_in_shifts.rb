class RenameProjectIdToEmploymentIdInShifts < ActiveRecord::Migration
  def self.up
    rename_column :shifts, :project_id, :employment_id
  end

  def self.down
    rename_column :shifts, :employment_id, :project_id
  end
end
