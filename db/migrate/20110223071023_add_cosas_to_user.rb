class AddCosasToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :telefono_particular, :string
    add_column :users, :telefono_celular, :string
    add_column :users, :email_personal, :string
  end

  def self.down
    remove_column :users, :email_personal
    remove_column :users, :telefono_celular
    remove_column :users, :telefono_particular
  end
end
