class CommunityLeader < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	accepts_nested_attributes_for :user
	belongs_to :city

	def city=(val)
    city = City.where(name: val).first_or_create
    self.city_id = city.id
  end
end
