class AddCompletoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :completo, :boolean
  end

  def self.down
    remove_column :users, :completo
  end
end
