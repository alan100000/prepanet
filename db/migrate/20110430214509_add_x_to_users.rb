																										class AddXToUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :fecha_de_vencimiento, :string
  end

  def self.down
	change_column :users, :fecha_de_vencimiento, :date
  end
end
