class MajorsController < ApplicationController
  # GET /majors
  # GET /majors.xml
load_and_authorize_resource
  def index
    @majors = Major.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @majors }
    end
  end

  # GET /majors/1
  # GET /majors/1.xml
  def show
    @major = Major.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @major }
    end
  end

  # GET /majors/new
  # GET /majors/new.xml
  def new
    @major = Major.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @major }
    end
  end

  # GET /majors/1/edit
  def edit
    @major = Major.find(params[:id])
  end

  # POST /majors
  # POST /majors.xml
  def create
    @major = Major.new(params[:major])

    respond_to do |format|
      if @major.save
        format.html { redirect_to(@major, :notice => 'Major was successfully created.') }
        format.xml  { render :xml => @major, :status => :created, :location => @major }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @major.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /majors/1
  # PUT /majors/1.xml
  def update
    @major = Major.find(params[:id])

    respond_to do |format|
      if @major.update_attributes(params[:major])
        format.html { redirect_to(@major, :notice => 'Major was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @major.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /majors/1
  # DELETE /majors/1.xml
  def destroy
    @major = Major.find(params[:id])
    @major.destroy

    respond_to do |format|
      format.html { redirect_to(majors_url) }
      format.xml  { head :ok }
    end
  end
end
