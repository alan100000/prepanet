class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
load_and_authorize_resource
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.xls { send_data @users.to_xls }
      format.csv { send_data @users.to_csv }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = user.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
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
