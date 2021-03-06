# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db=>seed (or created alongside the db with db=>setup).
#
# Examples=>
#
#   cities = City.create([{ name=> 'Chicago' }, { name=> 'Copenhagen' }])
#   Mayor.create

City.destroy_all
cities = City.create([{ name: 'Tel Aviv' }, { name: 'Kfar Saba' }])

User.destroy_all
users = User.create([
	{
		email: "admin@mailinator.com",
		password: "1234.com",
		password_confirmation: "1234.com",
		admin: true
	},
	{
		email: "user1@mailinator.com",
		password: "1234.com",
		password_confirmation: "1234.com",
		phone: "0527738447",
		first_name: "User1",
		last_name: "User1"
	},
	{ 
		email: "user2@mailinator.com",
		password: "1234.com",
		password_confirmation: "1234.com",
		phone: "0523112137",
		first_name: "User2",
		last_name: "User2"
	}
])

Host.destroy_all
hosts = Host.create([
	{
		hosted_before: true,
		org_name: "Boyscouts",
		org_role: "Head Scout",
		country: "ישראל",
		city: "רעננה",
		address: "איינשטיין 29",
		lat: "32.1839926",
		lng: "34.8830608000001",
		floor: 2,
		elevator: false,
		event_date: "4.5.2016",
		event_time: "20:00",
		language: "אנגלית",
		survivor_needed: true,
		public: true,
		free_text: "Testing automatic deploy",
		user_id: users[1].id
	},
	{
		hosted_before: false,
		country: "ישראל",
		city: "תל אביב יפו",
		address: "שלום עליכם",
		lat: "32.0770745",
		lng: "34.7695493",
		floor: 2,
		elevator: false,
		event_date: "4.5.2016",
		event_time: "20:00",
		language: "עברית",
		survivor_needed: true,
		public: true,
		free_text: "My grandma lives on my couch",
		user_id: users[2].id
	}
])

Guest.destroy_all
guests = Guest.create([
	{
		user_attributes: {
			email: "guest1@mailinator.com",
			phone: "12345",
			first_name: "Guest1",
			last_name: "Guest1",
			password: "1234.com",
			password_confirmation: "1234.com"
		}
	},
	{
		user_attributes: {
			email: "guest2@mailinator.com",
			phone: "12345",
			first_name: "Guest2",
			last_name: "Guest2",
			password: "1234.com",
			password_confirmation: "1234.com"
		}
	}
])

CommunityLeader.destroy_all
community_leaders = CommunityLeader.create([
	{
		cities: "Tel Aviv, Kfar Saba",
		user_attributes: {
			email: "cl1@mailinator.com",
			phone: "12345",
			first_name: "CommunityLeader1",
			last_name: "CommunityLeader1",
			password: "1234.com",
			password_confirmation: "1234.com"
		}
	},
	{
		cities: "Kfar Saba",
		user_attributes: {
			email: "cl2@mailinator.com",
			phone: "12345",
			first_name: "CommunityLeader2",
			last_name: "CommunityLeader2",
			password: "1234.com",
			password_confirmation: "1234.com"
		}
	}
])

Request.destroy_all
requests = Request.create([
	{
		host_id: hosts[0].id,
		guest_id: guests[0].id
		},
		{
			host_id: hosts[0].id,
			guest_id: guests[1].id
			},
			{
				host_id: hosts[1].id,
				guest_id: guests[0].id
			}
			])