class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.string :title
      t.integer :employment_id
      t.integer :employee_id
      t.float :sum
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
