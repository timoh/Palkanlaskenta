# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110809152130) do

  create_table "employees", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.float    "minimum_wage"
    t.date     "employment_start"
    t.date     "employment_end"
    t.float    "default_provision"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current_employee"
  end

  create_table "employments", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "project_id"
    t.float    "minimum_wage"
    t.float    "provision"
    t.boolean  "comes_on_top"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.date     "project_start"
    t.date     "project_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "project_id"
    t.date     "start_date"
    t.time     "start_time"
    t.float    "break_duration"
    t.float    "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
