class AddMateriasToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :materia_1, :integer
    add_column :users, :materia_2, :integer
    add_column :users, :materia_3, :integer
  end

  def self.down
    remove_column :users, :materia_3
    remove_column :users, :materia_2
    remove_column :users, :materia_1
  end
end
