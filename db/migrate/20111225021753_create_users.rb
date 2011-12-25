class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :cell_phone
      t.string :experience

      t.timestamps
    end
  end
end
