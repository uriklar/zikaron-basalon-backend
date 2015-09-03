class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone
      t.boolean :survivor_needed
      t.boolean :strangers_allowed
      t.integer :max_guests
      t.text :free_text
      t.date :event_date

      t.timestamps
    end
  end
end
