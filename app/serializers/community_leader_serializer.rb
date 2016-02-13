class CommunityLeaderSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :cities
  has_one  :user
end
