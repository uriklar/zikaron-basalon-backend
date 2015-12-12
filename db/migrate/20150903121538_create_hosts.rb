class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :address
      t.boolean :strangers_allowed
      t.integer :max_guests
      t.text :free_text
      t.datetime :event_datetime
      t.float :lat  
      t.float :lng
      t.text :accessibility
      t.string :org_name
      t.string :org_role
      t.boolean :hosted_in_past
      t.boolean :profile_public
      t.integer :survivor_id

      t.timestamps
    end
  end
end
