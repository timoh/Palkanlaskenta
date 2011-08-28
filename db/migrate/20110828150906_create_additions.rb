class CreateAdditions < ActiveRecord::Migration
  def self.up
    create_table :additions do |t|
      t.string :title
      t.text :description
      t.float :sum
      t.date :date
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :additions
  end
end
