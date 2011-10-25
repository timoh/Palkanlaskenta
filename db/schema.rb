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

ActiveRecord::Schema.define(:version => 20111025110425) do

  create_table "additions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "sum"
    t.date     "date"
    t.integer  "employment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "contact_person_name"
    t.string   "contact_person_email"
    t.string   "contact_person_phone"
    t.text     "billing_address"
    t.text     "billing_details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_code"
  end

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
    t.float    "hourly_wage"
    t.float    "provision"
    t.boolean  "comes_on_top"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.string   "title"
    t.date     "payment_date"
    t.float    "sum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.date     "project_start"
    t.date     "project_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", :force => true do |t|
    t.string   "title"
    t.integer  "employment_id"
    t.integer  "employee_id"
    t.float    "sum"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer"
    t.integer  "customer_id"
    t.text     "order_confirmation"
    t.boolean  "billing_request_sent"
    t.boolean  "billed"
    t.date     "confirmation_date"
  end

  create_table "shifts", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "employment_id"
    t.date     "start_date"
    t.time     "start_time"
    t.float    "break_duration"
    t.float    "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "employee_id"
  end

end
