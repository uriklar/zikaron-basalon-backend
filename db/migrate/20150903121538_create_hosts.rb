class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.boolean :hosted_before
      t.string :address
      t.boolean :public
      t.text :free_text
      t.boolean :survivor_needed
      t.date :event_date
      t.string :event_time
      t.float :lat  
      t.float :lng
      t.integer :floor
      t.boolean :elevator
      t.boolean :stairs
      t.string :org_name
      t.string :org_role
      t.integer :survivor_id
      t.integer :city_id
      t.integer :country_id
      t.string :language

      t.timestamps
    end
  end
end
