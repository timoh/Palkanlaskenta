class SalesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  # GET /sales
  # GET /sales.xml
  def index
    @sales = Sale.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  def new
  
    if Employee.all.count == 0 || Customer.all.count == 0
      if Employee.all.count == 0
        redirect_to :employees, :notice => 'Create an employee first!'
      else
        redirect_to :customers, :notice => 'Create a customer first!'
      end
    else
      @sale = Sale.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @sale }
      end
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  def create
    @sale = Sale.new(params[:sale])
    employment_id = params[:employment_id]
    @sale.employee_id = @sale.employment.employee.id

    respond_to do |format|
      if @sale.save
        
        logger.info "Sale #{@sale.title} created by #{current_user.email}"
        
        format.html { redirect_to(sales_path, :notice => 'Sale was successfully created.') }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  def update
    @sale = Sale.find(params[:id])
    employment_id = params[:id][:employment_id]
    @sale.employee_id = @sale.employment.employee.id
    
    

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        
        logger.info "Sale #{@sale.title} updated by #{current_user.email}"
        
        format.html { redirect_to(sales_path, :notice => 'Sale was successfully updated.'+metrify_log("Updated sale")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  def destroy
    
    @sale = Sale.find(params[:id])
    logger.info "Sale #{@sale.title} destroyed by #{current_user.email}"
    
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to(sales_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def sort_column
    Sale.column_names.include?(params[:sort]) ? params[:sort] : "confirmation_date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  
end
