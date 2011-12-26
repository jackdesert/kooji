class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :program_id
      t.string :event_status
      t.string :event_is_program
      t.string :event_name
      t.string :rating
      t.text :pricing
      t.text :description
      t.text :trip_info
      t.text :gear_list
      t.text :confirmation_page
      t.text :question1
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
