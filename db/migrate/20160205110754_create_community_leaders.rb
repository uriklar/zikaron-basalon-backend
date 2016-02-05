class CreateCommunityLeaders < ActiveRecord::Migration
  def change
    create_table :community_leaders do |t|
      t.integer :city_id

      t.timestamps
    end
  end
end
