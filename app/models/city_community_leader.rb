class CityCommunityLeader < ActiveRecord::Base
	belongs_to :city
	belongs_to :community_leader
end
