class AddPeriodoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :periodo, :string
  end

  def self.down
    remove_column :users, :periodo
  end
end
