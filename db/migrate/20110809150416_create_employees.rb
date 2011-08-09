class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.float :minimum_wage
      t.date :employment_start
      t.date :employment_end
      t.float :default_provision

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
