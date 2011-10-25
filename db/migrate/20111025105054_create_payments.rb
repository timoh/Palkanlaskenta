class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.string :title
      t.date :payment_date
      t.float :sum

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
