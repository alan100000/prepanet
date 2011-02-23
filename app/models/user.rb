class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation ,
		  :nombre ,:apellido_paterno ,:apellido_materno ,:sexo ,:matricula ,
		  :telefono_particular, :telefono_celular , :email_personal,
		  :promedio_global_acumulado, :promedio_del_semestre_anterior,
		  :nombre_del_seguro, :compania, :numero_de_poliza, :fecha_de_vencimiento, :contacto_emergencia, :parentesco, :telefono_emergencia
		  :remember_me
end
