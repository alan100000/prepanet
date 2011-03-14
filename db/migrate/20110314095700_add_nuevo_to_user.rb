class AddNuevoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :semestre, :integer
  end

  def self.down
    remove_column :users, :semestre
  end
end
