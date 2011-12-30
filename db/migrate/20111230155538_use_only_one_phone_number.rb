class UseOnlyOnePhoneNumber < ActiveRecord::Migration
  def up
    rename_column :users, :phone_cell, :phone
    remove_column :users, :phone_day
    remove_column :users, :phone_evening
  end

  def down
    rename_column :users, :phone, :phone_cell
    add_column :users, :phone_day, :string, :default => "", :null => false
    add_column :users, :phone_evening, :string, :default => "", :null => false
  end
end
