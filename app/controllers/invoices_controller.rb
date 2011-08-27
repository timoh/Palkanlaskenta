class InvoicesController < ApplicationController
  def index
    @invoices = Sale.find_all_by_billed(true)
  end
end
