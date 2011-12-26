class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :register_status
      t.string :need_ride
      t.integer :can_take
      t.string :leaving_from
      t.string :leave_time
      t.string :returning_to
      t.string :return_time
      t.text :gear_answer
      t.text :answer1
      t.text :has_questions

      t.timestamps
    end
  end
end
