class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :host_id
      t.integer :guest_id
      t.integer :num_of_people
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
