class AddMasCosasToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :promedio_global_acumulado, :integer
    add_column :users, :promedio_del_semestre_anterior, :integer
  end

  def self.down
    remove_column :users, :promedio_del_semestre_anterior
    remove_column :users, :promedio_global_acumulado
  end
end
