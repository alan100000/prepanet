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
    Spreadsheet.client_encoding='UTF-8'
    @users = User.all
    @usuarios = User.select('matricula, nombre, apellido_paterno, apellido_materno, email, email_personal, telefono_particular, telefono_celular, major_id, materia_1, materia_2, materia_3, semestre, admin').where(:period_id => @period.id).order(:matricula)

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    i = 1
    sheet1[0,0] = 'Matricula'
    sheet1[0,1] = 'Nombre'
    sheet1[0,2] = 'Apellido Paterno'
    sheet1[0,3] = 'Apellido Materno'
    sheet1[0,4] = 'Correo Electronico'
    sheet1[0,5] = 'Correo Opcional'
    sheet1[0,6] = 'Tel Casa'
    sheet1[0,7] = 'Celular'
    sheet1[0,8] = 'Carrera'
    sheet1[0,9] = 'Opcion 1'
    sheet1[0,10] = 'Opcion 2'
    sheet1[0,11] = 'Opcion 3'
    sheet1[0,12] = 'Semestre'

    for user in @usuarios
      sheet1[i,0] = user.matricula
      sheet1[i,1] = user.nombre
      sheet1[i,2] = user.apellido_paterno
      sheet1[i,3] = user.apellido_materno
      sheet1[i,4] = user.email
      sheet1[i,5] = user.email_personal
      sheet1[i,6] = user.telefono_particular
      sheet1[i,7] = user.telefono_celular

      @majors = Major.select('sigla').where(:id => user.major_id)
      for major in @majors
	puts(user.nombre + " " + major.sigla)
	sheet1[i,8] = major.sigla
      end
      @courses = Course.select('area_id').where(:id => user.materia_1)
      for course in @courses
	@areas = Area.select('nombre').where(:id => course.area_id)
	for area in @areas
	  sheet1[i,9] = area.nombre
	end
      end
      @courses = Course.select('area_id').where(:id => user.materia_2)
      for course in @courses
	@areas = Area.select('nombre').where(:id => course.area_id)
	for area in @areas
	  sheet1[i,10] = area.nombre
	end
      end
      @courses = Course.select('area_id').where(:id => user.materia_3)
      for course in @courses
	@areas = Area.select('nombre').where(:id => course.area_id)
	for area in @areas
	  sheet1[i,11] = area.nombre
	end
      end
      sheet1[i,12] = user.semestre
      i = i+1
    end
    blob = StringIO.new('')
    book.write blob
    respond_to do |format|
      format.html # show.html.erb
      format.xls { send_data blob.string, :type => :xls, :filename => "testt.xls" }
      format.xml  { render :xml => @period }
    end
  end


  # GET /periods/new
  # GET /periods/new.xml
  def new
    @period = Period.new
    @acciones = "Crear Periodo"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @period }
    end
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
    @acciones = "Editar Periodo"

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
