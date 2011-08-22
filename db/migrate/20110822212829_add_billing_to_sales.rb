class AddBillingToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :billing_request, :text
    add_column :sales, :billing_request_sent, :boolean
    add_column :sales, :billed, :boolean
  end

  def self.down
    remove_column :sales, :billing_request
    remove_column :sales, :billing_request_sent
    remove_column :sales, :billed
  end
end
