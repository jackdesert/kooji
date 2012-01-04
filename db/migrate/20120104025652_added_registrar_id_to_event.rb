class AddedRegistrarIdToEvent < ActiveRecord::Migration
  def up
    add_column :events, :registrar_id, :integer
  end

  def down
    remove_columns :events, :registrar_id
  end
end
