class HostSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :address, :phone, :survivor_needed, :strangers_allowed, :max_guests, :free_text, :event_date, :user_id

  has_many :requests
end
