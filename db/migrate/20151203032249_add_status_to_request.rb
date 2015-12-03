class AddStatusToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :status, :string, default: 'pending'
  end
end
