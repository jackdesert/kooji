class AddedCarpoolingBlurb < ActiveRecord::Migration
  def change
    add_column :registrations, :carpooling_blurb, :text
  end
end
