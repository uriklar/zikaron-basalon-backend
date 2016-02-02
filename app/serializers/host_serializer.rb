class HostSerializer < ActiveModel::Serializer
  attributes :id

  has_many :requests
end
