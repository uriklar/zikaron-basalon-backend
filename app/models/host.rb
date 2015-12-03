class Host < ActiveRecord::Base
	belongs_to :user
	has_many :requests

	validates :user_id, presence: true, uniqueness: true
end
