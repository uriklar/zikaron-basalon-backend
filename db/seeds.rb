# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db=>seed (or created alongside the db with db=>setup).
#
# Examples=>
#
#   cities = City.create([{ name=> 'Chicago' }, { name=> 'Copenhagen' }])
#   Mayor.create
User.destroy_all
users = User.create([
    {
        email: "admin@mailinator.com",
        password: "1234.com",
        password_confirmation: "1234.com",
        admin: true
    }
])

Host.destroy_all
hosts = Host.create([
    {
        "address"=> "איינשטיין 29, רעננה, ישראל",
        "max_guests"=> 0,
        "free_text"=> "אושפזה עם זיהום חריף יומיים לפני יום השואה ונאלצה לבטל",
        "strangers_allowed"=> false,
        "lat"=> 32.1839926,
        "lng"=> 34.8830608000001,
        "user_attributes" => 
            { 
                email: "user1@mailinator.com",
                password: "1234.com",
                password_confirmation: "1234.com",
                phone: "0527738447",
                first_name: "User1",
                last_name: "User1"
            }
    },
    {
        
        "address"=> "שלום עליכם, תל אביב יפו, ישראל",
        "max_guests"=> 20,
        "free_text"=> "קומה ראשונה - 4/5 מדרגות. היה מארח בעבר (כמה וכמה פעמים)",
        "strangers_allowed"=> false,
        "lat"=> 32.0770745,
        "lng"=> 34.7695493,
        "user_attributes" => 
            { 
                email: "user2@mailinator.com",
                password: "1234.com",
                password_confirmation: "1234.com",
                phone: "0523112137",
                first_name: "User2",
                last_name: "User2"
            }
        
    },
    {
        "address"=> "החרש 4, הוד השרון, ישראל",
        "max_guests"=> 15,
        "free_text"=> "אשמח לארח את תמי, תודה!",
        "strangers_allowed"=> true,
        "lat"=> 32.1324472,
        "lng"=> 34.8987391000001,
        "user_attributes" => 
            { 
                email: "user3@mailinator.com",
                password: "1234.com",
                password_confirmation: "1234.com",
                phone: "0523155137",
                first_name: "User3",
                last_name: "User3"
            }
        
    }
])

Guest.destroy_all
guests = Guest.create([
    {
        user_attributes: {
            email: "guest1@mailinator.com",
            phone: "12345",
            first_name: "Guest1",
            last_name: "Guest1"
        }
    },
    {
        user_attributes: {
            email: "guest2@mailinator.com",
            phone: "12345",
            first_name: "Guest2",
            last_name: "Guest2"
        }
    },
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