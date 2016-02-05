class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :address, :contacted
end
