class AddConfirmationDateToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :confirmation_date, :date
  end

  def self.down
    remove_column :sales, :confirmation_date
  end
end
