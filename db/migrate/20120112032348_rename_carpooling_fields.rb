class RenameCarpoolingFields < ActiveRecord::Migration
  def up
    rename_column(:registrations, :need_ride, :carpooling)
    rename_column(:registrations, :can_take, :room_for)
  end

  def down
    rename_column(:registrations, :carpooling, :need_ride)
    rename_column(:registrations, :room_for, :can_take)
  end
end
