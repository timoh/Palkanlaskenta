class InvoicesController < ApplicationController
  helper_method :calculate_sum_invoicable
  
  def index
    @invoices = Sale.find_all_by_billed(false)
    @total = calculate_sum_invoicable
  end
  
  private
  
  def calculate_sum_invoicable
    sum_total = 0
    @invoices = Sale.find_all_by_billed(false)
    
    @invoices.each do |invoice|
      sum_total = sum_total+invoice.sum
    end
    
    sum_total
  end
end
