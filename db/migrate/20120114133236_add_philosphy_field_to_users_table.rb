class AddPhilosphyFieldToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :leadership_philosophy, :text
    add_column :registrations, :display_phone, :boolean
  end
end
