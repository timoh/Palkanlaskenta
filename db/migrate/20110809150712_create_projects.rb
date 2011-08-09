class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.date :project_start
      t.date :project_end

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
