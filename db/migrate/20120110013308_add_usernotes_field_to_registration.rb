class AddUsernotesFieldToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :user_notes, :text
    add_column :registrations, :registrar_notes, :text
  end
end
