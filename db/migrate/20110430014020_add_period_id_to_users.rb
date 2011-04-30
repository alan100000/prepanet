class AddPeriodIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :period_id, :integer
  end

  def self.down
    remove_column :users, :period_id
  end
end
