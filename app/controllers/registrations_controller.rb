class RegistrationsController < Devise::RegistrationsController

    def index
        super
    end
    
    def show
        super
    end
    
    def new
        super
    end
    
    def edit
        super
    end
    
    def create
        @user = User.new(params[:user])
        semes = params[:semestre]
            @user.semestre=semes
         periodo = Period.last
         @user.period_id = periodo.id

        respond_to do |format|
          if @user.save
            format.html { redirect_to root_url }
            format.xml  { render :xml => @user, :status => :created, :location => @user }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          end
        end
    end
    
    def update
        super
    end
    
    def destroy
        super
    end

end
