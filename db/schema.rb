# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20110314012505) do
=======
ActiveRecord::Schema.define(:version => 20110314015437) do
>>>>>>> 724a0eac280442dba21e243bb3ad93dc25502b34

  create_table "areas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "area_id"
  end

  create_table "majors", :force => true do |t|
    t.string   "nombre"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                         :default => "", :null => false
    t.string   "encrypted_password",             :limit => 128, :default => "", :null => false
    t.string   "password_salt",                                 :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                 :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "sexo",                           :limit => nil
    t.string   "matricula",                      :limit => nil
    t.string   "telefono_particular"
    t.string   "telefono_celular"
    t.string   "email_personal"
    t.integer  "promedio_global_acumulado"
    t.integer  "promedio_del_semestre_anterior"
    t.string   "nombre_del_seguro"
    t.string   "compania"
    t.string   "numero_de_poliza"
    t.date     "fecha_de_vencimiento"
    t.string   "contacto_emergencia"
    t.string   "parentesco"
    t.string   "telefono_emergencia"
<<<<<<< HEAD
    t.integer  "major_id"
=======
    t.boolean  "admin"
>>>>>>> 724a0eac280442dba21e243bb3ad93dc25502b34
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
