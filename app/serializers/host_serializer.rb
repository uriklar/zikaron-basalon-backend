class HostSerializer < ActiveModel::Serializer
  attributes :id, :hosted_before, :address, :public, :free_text, :survivor_needed,
             :event_date, :event_time, :lat, :lng, :floor, :elevator, :stairs,
             :org_name, :org_role, :survivor_id, :language, :city_id, :country_id

  has_many :requests
  has_one :city
  has_one :country
end
