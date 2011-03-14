class AddCarreraToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :major_id, :integer
  end

  def self.down
    remove_column :users, :major_id
  end
end
