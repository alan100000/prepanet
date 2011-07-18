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
		  :nombre_del_seguro, :compania, :numero_de_poliza, :fecha_de_vencimiento, :contacto_emergencia, :parentesco, :telefono_emergencia,
		  :major_id, :materia_1, :materia_2, :materia_3,
		  :remember_me
		  
  #RELACIONES
  has_one :major
  has_many :courses
   

  validates_presence_of :password_confirmation, :on=>:create, :message => ": Contrasena invalida"

  validates_presence_of :nombre, :message => ": Falta ingresar tu nombre"
  validates_presence_of :apellido_paterno, :message => ": Falta ingresar tu apellido paterno"
  validates_presence_of :apellido_materno, :message => ": Falta ingresar tu apellido materno"
  validates_presence_of :sexo, :message => ": Falta seleccionar tu sexo"
  validates_presence_of :matricula, :message => ": Falta ingresar tu matricula"

  validates_presence_of :telefono_particular, :message => ": Falta ingresar tu telefono particular"
  validates_presence_of :telefono_celular, :message => ": Falta ingresar tu telefono celular"
  validates_presence_of :email_personal, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }, :message => ": Email invalido"

  validates_presence_of :promedio_global_acumulado, :numericality => true, :message => ": Debe haber un valor numerico"
  validates_presence_of :promedio_del_semestre_anterior, :numericality => true, :message => ": Debe haber un valor numerico"

  validates_presence_of :nombre_del_seguro, :message => ": Faltan datos de tu seguro"
  validates_presence_of :compania, :message => ": Faltan datos de tu seguro"
  validates_presence_of :numero_de_poliza, :message => ": Faltan datos de tu seguro"
  validates_presence_of :fecha_de_vencimiento, :message => ": Faltan datos de tu seguro"
  validates_presence_of :contacto_emergencia, :message => ": Falta ingresar contacto"
  validates_presence_of :parentesco, :message => ": Falta ingresar el parentesco"
  validates_presence_of :telefono_emergencia, :message => ": Falta ingresar telefono de emergencia"
end
