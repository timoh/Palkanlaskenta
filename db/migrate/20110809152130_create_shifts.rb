class CreateShifts < ActiveRecord::Migration
  def self.up
    create_table :shifts do |t|
      t.integer :employee_id
      t.integer :project_id
      t.date :start_date
      t.time :start_time
      t.float :break_duration
      t.float :duration

      t.timestamps
    end
  end

  def self.down
    drop_table :shifts
  end
end
