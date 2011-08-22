class RenameBillingRequestToBillingConfirmation < ActiveRecord::Migration
  def self.up
    rename_column :sales, :billing_request, :order_confirmation
  end

  def self.down
    rename_column :sales, :order_confirmation, :billing_request
  end
end
