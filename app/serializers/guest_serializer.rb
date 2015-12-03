class GuestSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :first_name, :last_name
end
