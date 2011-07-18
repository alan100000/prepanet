class PeriodsController < ApplicationController
  # GET /periods
  # GET /periods.xml
  def index
    @periods = Period.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @periods }
    end
  end

  # GET /periods/1
  # GET /periods/1.xml
  def show
    @period = Period.find(params[:id])
    @usuarios = User.where(:period_id => @period.id).order(:matricula)
    @usua = User.select('matricula, nombre, apellido_paterno, apellido_materno, email, email_personal, telefono_particular, telefono_celular, major_id.sigla, materia_1.area_id.nombre, materia_2.area_id.nombre, materia_3.narea_id.nombre, semestre').where(:period_id => @period.id).order(:matricula)

    respond_to do |format|
      format.html # show.html.erb
      format.xls { send_data @usua.to_xls }
      format.xml  { render :xml => @period }
    end
  end
  

  # GET /periods/new
  # GET /periods/new.xml
  def new
    @period = Period.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @period }
    end
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
  end

  # POST /periods
  # POST /periods.xml
  def create
    @period = Period.new(params[:period])

    respond_to do |format|
      if @period.save
        format.html { redirect_to(@period, :notice => 'Period was successfully created.') }
        format.xml  { render :xml => @period, :status => :created, :location => @period }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periods/1
  # PUT /periods/1.xml
  def update
    @period = Period.find(params[:id])

    respond_to do |format|
      if @period.update_attributes(params[:period])
        format.html { redirect_to(@period, :notice => 'Period was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.xml
  def destroy
    @period = Period.find(params[:id])
    @period.destroy

    respond_to do |format|
      format.html { redirect_to(periods_url) }
      format.xml  { head :ok }
    end
  end
end
