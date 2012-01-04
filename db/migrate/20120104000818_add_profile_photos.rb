class AddProfilePhotos < ActiveRecord::Migration
  def up
    add_column :users, :photo_file_name, :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size, :integer
  end

  def down
    remove_columns :users, :photo_file_name, :photo_content_type, :photo_file_size
  end
end
