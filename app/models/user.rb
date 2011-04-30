class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :recoverable,:lockable and :timeoutable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation ,
		  :nombre ,:apellido_paterno ,:apellido_materno ,:sexo ,:matricula ,
		  :telefono_particular, :telefono_celular , :email_personal,
		  :promedio_global_acumulado, :promedio_del_semestre_anterior,
		  :nombre_del_seguro, :compania, :numero_de_poliza, :fecha_de_vencimiento, :contacto_emergencia, :parentesco, :telefono_emergencia
		  :remember_me
		  
  #RELACIONES
  has_one :major
   

  validates :password_confirmation, :presence => true

  validates :nombre, :presence => true
  validates :apellido_paterno, :presence => true
  validates :apellido_materno, :presence => true
  validates :sexo, :presence => true
  validates :matricula, :presence => true

  validates :telefono_particular, :presence => true
  validates :telefono_celular, :presence => true
  validates :email_personal, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :promedio_global_acumulado, :presence => true, :numericality => true
  validates :promedio_del_semestre_anterior, :presence => true, :numericality => true

  validates :nombre_del_seguro, :presence => true
  validates :compania, :presence => true
  validates :numero_de_poliza, :presence => true
  #validates :fecha_de_vencimiento, :presence => true
  validates :contacto_emergencia, :presence => true
  validates :parentesco, :presence => true
  validates :telefono_emergencia, :presence => true
end
