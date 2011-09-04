class InvoicesController < ApplicationController
  helper_method :sort_column, :sort_direction, :calculate_sum_invoicable
  
  def index
    @invoices = Sale.not_billed.order(sort_column + " " + sort_direction)
    @total = calculate_sum_invoicable
  end
  
  private
  
  def sort_column
    Sale.column_names.include?(params[:sort]) ? params[:sort] : "confirmation_date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def calculate_sum_invoicable
    sum_total = 0
    @to_be_summed = Sale.not_billed
    
    @to_be_summed.each do |invoice|
      sum_total = sum_total+invoice.sum
    end
    
    sum_total
  end
end
