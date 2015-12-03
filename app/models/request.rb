class Request < ActiveRecord::Base
	belongs_to :host
	belongs_to :guest

	validates :host_id, presence: true
	validates :guest_id, presence: true
	validates :host_id, uniqueness: {scope: :guest_id}
end
