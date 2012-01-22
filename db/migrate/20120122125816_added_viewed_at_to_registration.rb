class AddedViewedAtToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :viewed_by_registrar, :boolean
  end

end
