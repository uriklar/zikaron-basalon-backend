class Host < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	belongs_to :country
	belongs_to :city
	accepts_nested_attributes_for :user
	has_many :requests

  def city=(val)
    city = City.where(name: val).first_or_create
    self.city_id = city.id
  end

  def country=(val)
  	country = Country.where(name: val).first_or_create
    self.country_id = country.id
  end

  def user_id=(val)
  	self.user = User.find(val)
  end
end
