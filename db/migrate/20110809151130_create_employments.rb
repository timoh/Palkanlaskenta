class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.integer :employee_id
      t.integer :project_id
      t.float :minimum_wage
      t.float :provision
      t.boolean :comes_on_top

      t.timestamps
    end
  end

  def self.down
    drop_table :employments
  end
end
