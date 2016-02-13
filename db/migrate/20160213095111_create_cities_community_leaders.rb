class CreateCitiesCommunityLeaders < ActiveRecord::Migration
  def change
    create_table :cities_community_leaders do |t|
    	t.belongs_to :city
      t.belongs_to :community_leader
    end
  end
end
