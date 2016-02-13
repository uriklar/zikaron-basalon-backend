class CreateCommunityLeaders < ActiveRecord::Migration
  def change
    create_table :community_leaders do |t|
      t.string :email

      t.timestamps
    end
  end
end
