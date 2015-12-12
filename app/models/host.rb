class Host < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	accepts_nested_attributes_for :user
	has_many :requests
end
