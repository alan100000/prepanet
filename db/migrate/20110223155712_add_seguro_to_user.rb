class AddSeguroToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nombre_del_seguro, :string
    add_column :users, :compania, :string
    add_column :users, :numero_de_poliza, :string
    add_column :users, :fecha_de_vencimiento, :date
    add_column :users, :contacto_emergencia, :string
    add_column :users, :parentesco, :string
    add_column :users, :telefono_emergencia, :string
  end

  def self.down
    remove_column :users, :telefono_emergencia
    remove_column :users, :parentesco
    remove_column :users, :contacto_emergencia
    remove_column :users, :fecha_de_vencimiento
    remove_column :users, :numero_de_poliza
    remove_column :users, :compania
    remove_column :users, :nombre_del_seguro
  end
end
