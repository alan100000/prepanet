class AddAreaToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :area_id, :integer
  end

  def self.down
    remove_column :courses, :area_id
  end
end
