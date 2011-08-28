class AdditionsController < ApplicationController
  # GET /additions
  # GET /additions.xml
  def index
    @additions = Addition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @additions }
    end
  end

  # GET /additions/1
  # GET /additions/1.xml
  def show
    @addition = Addition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @addition }
    end
  end

  # GET /additions/new
  # GET /additions/new.xml
  def new
    @addition = Addition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @addition }
    end
  end

  # GET /additions/1/edit
  def edit
    @addition = Addition.find(params[:id])
  end

  # POST /additions
  # POST /additions.xml
  def create
    @addition = Addition.new(params[:addition])

    respond_to do |format|
      if @addition.save
        format.html { redirect_to(@addition, :notice => 'Addition was successfully created.') }
        format.xml  { render :xml => @addition, :status => :created, :location => @addition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @addition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /additions/1
  # PUT /additions/1.xml
  def update
    @addition = Addition.find(params[:id])

    respond_to do |format|
      if @addition.update_attributes(params[:addition])
        format.html { redirect_to(@addition, :notice => 'Addition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @addition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /additions/1
  # DELETE /additions/1.xml
  def destroy
    @addition = Addition.find(params[:id])
    @addition.destroy

    respond_to do |format|
      format.html { redirect_to(additions_url) }
      format.xml  { head :ok }
    end
  end
end
