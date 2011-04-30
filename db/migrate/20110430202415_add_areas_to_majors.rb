class AddAreasToMajors < ActiveRecord::Migration
  def self.up
    add_column :majors, :area_1, :integer
    add_column :majors, :area_2, :integer
    add_column :majors, :area_3, :integer
    add_column :majors, :area_4, :integer
    add_column :majors, :area_5, :integer
  end

  def self.down
    remove_column :majors, :area_5
    remove_column :majors, :area_4
    remove_column :majors, :area_3
    remove_column :majors, :area_2
    remove_column :majors, :area_1
  end
end
