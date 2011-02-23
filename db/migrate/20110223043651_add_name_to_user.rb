class AddNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nombre, :string
    add_column :users, :apellido_paterno, :string
    add_column :users, :apellido_materno, :string
    add_column :users, :sexo, :String
    add_column :users, :matricula, :String
  end

  def self.down
    remove_column :users, :matricula
    remove_column :users, :sexo
    remove_column :users, :apellido_materno
    remove_column :users, :apellido_paterno
    remove_column :users, :nombre
  end
end
