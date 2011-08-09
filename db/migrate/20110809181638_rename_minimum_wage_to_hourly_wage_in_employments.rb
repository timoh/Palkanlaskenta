class RenameMinimumWageToHourlyWageInEmployments < ActiveRecord::Migration
  def self.up
    rename_column :employments, :minimum_wage, :hourly_wage
  end

  def self.down
    rename_column :employments, :hourly_wage, :minimum_wage
  end
end
