class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end