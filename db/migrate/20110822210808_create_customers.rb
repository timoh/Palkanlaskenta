class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :contact_person_name
      t.string :contact_person_email
      t.string :contact_person_phone
      t.text :billing_address
      t.text :billing_details

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
