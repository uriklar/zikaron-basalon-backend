class Host < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	belongs_to :country
	belongs_to :city
	accepts_nested_attributes_for :user
	has_many :requests
end
