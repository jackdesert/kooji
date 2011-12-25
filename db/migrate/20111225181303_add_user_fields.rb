class AddUserFields < ActiveRecord::Migration
  def up
    add_column(:users, :user_type, :string)
    add_column(:users, :phone_day, :string)
    add_column(:users, :phone_evening, :string)
    add_column(:users, :member, :boolean)
    add_column(:users, :emergency_contact, :text)
    add_column(:users, :exercise, :text)
    add_column(:users, :medical, :text)
    add_column(:users, :diet, :text)
    add_column(:users, :leader_request, :boolean)

  end

  def down
    remove_column(:users, :user_type, :phone_day, :phone_evening, :member, :emergency_contact, :exercise, :medical, :diet, :leader_request)
  end
end
