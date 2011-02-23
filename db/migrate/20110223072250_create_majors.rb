class CreateMajors < ActiveRecord::Migration
  def self.up
    create_table :majors do |t|
      t.string :nombre
      t.string :sigla

      t.timestamps
    end
  end

  def self.down
    drop_table :majors
  end
end
