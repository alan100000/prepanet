class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
load_and_authorize_resource
  def index
    Spreadsheet.client_encoding='UTF-8'
    @users = User.all
    @users = User.select('matricula, nombre, apellido_paterno, apellido_materno, email, email_personal, telefono_particular, telefono_celular, major_id, materia_1, materia_2, materia_3, semestre, admin').order(:matricula)

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
	
	for user in @users

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
	book.write './public/excel.xls'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.xls { send_data blob, :type => "application/ms-excel", :filename => "name.xls" }
      format.csv { send_data @users.to_csv }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = user.find(params[:id])
    @usua = User.select('matricula, nombre, apellido_paterno, apellido_materno, email, email_personal, telefono_particular, telefono_celular, major_id.sigla, materia_1.area_id.nombre, materia_2.area_id.nombre, materia_3.narea_id.nombre, semestre').where(:period_id => @period.id).order(:matricula)

    respond_to do |format|
      format.html # show.html.erb
format.xls { send_data @usua.to_xls }
      format.xml  { render :xml => @user }
      
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = user.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = user.find(params[:id])
  end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = user.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = user.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
