# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db=>seed (or created alongside the db with db=>setup).
#
# Examples=>
#
#   cities = City.create([{ name=> 'Chicago' }, { name=> 'Copenhagen' }])
#   Mayor.create
Host.destroy_all
hosts = Host.create([
    {
        "email"=> "Maya.lachovich@gmail.com",
        "phone"=> "0527738447",
        "address"=> "איינשטיין 29, רעננה, ישראל",
        "max_guests"=> 0,
        "free_text"=> "אושפזה עם זיהום חריף יומיים לפני יום השואה ונאלצה לבטל",
        "first_name"=> "מיה ",
        "last_name"=> "לחוביץ",
        "strangers_allowed"=> false,
        "survivor_needed"=> true,
        "lat"=> 32.1839926,
        "lng"=> 34.8830608000001
    },
    {
        "email"=> "arnon@kastina.co.il",
        "phone"=> "0523112137",
        "address"=> "שלום עליכם, תל אביב יפו, ישראל",
        "max_guests"=> 20,
        "free_text"=> "קומה ראשונה - 4/5 מדרגות. היה מארח בעבר (כמה וכמה פעמים)",
        "first_name"=> "ארנון",
        "last_name"=> "גל",
        "strangers_allowed"=> false,
        "survivor_needed"=> true,
        "lat"=> 32.0770745,
        "lng"=> 34.7695493
    },
    {
        "email"=> "maya.sender@idomoo.com",
        "phone"=> "054-7722573",
        "address"=> "החרש 4, הוד השרון, ישראל",
        "max_guests"=> 15,
        "free_text"=> "אשמח לארח את תמי, תודה!",
        "first_name"=> "מאיה",
        "last_name"=> "סנדר",
        "strangers_allowed"=> true,
        "survivor_needed"=> false,
        "lat"=> 32.1324472,
        "lng"=> 34.8987391000001
    }
])
