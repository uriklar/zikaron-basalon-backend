class HostSerializer < ActiveModel::Serializer
  attributes :address, :strangers_allowed, :max_guests, :free_text, :event_datetime

  has_many :requests
end
