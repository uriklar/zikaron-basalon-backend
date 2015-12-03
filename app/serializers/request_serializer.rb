class RequestSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :guest_id, :num_of_people
end
