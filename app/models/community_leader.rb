class CommunityLeader < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	accepts_nested_attributes_for :user
	has_and_belongs_to_many :cities

  validates :email, presence: true, uniqueness: true

	def cities=(cities)
    cities.split(',').each do |city_name|
      city = City.where(name: city_name).first_or_create
      self.cities.push(city)
    end
  end

  # def hosts
  # 	Hosts.where(city_id: self.cities.id)
  # end

  def new_hosts
  	self.hosts.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def not_contacted
  	self.hosts.where(contacted: false).where("created_at <= ?", 5.days.ago)
  end
end
