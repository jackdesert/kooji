class ChangeCellPhoneToPhoneCell < ActiveRecord::Migration
  def up
    rename_column(:users, :cell_phone, :phone_cell)
  end

  def down
    rename_column(:users, :phone_cell, :cell_phone)
  end
end
