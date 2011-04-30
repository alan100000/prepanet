class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.string :mes
      t.integer :ano

      t.timestamps
    end
  end

  def self.down
    drop_table :periods
  end
end
