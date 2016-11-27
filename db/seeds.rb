User.create(name: 'John Apple', email: 'john@example.com', password: '12345678')
User.create(name: 'Andrew Chun', email: 'andrew@example.com', password: '12345678')
User.create(name: 'Steve Cho', email: 'steve@example.com', password: '12345678')
User.create(name: 'Huy Dang', email: 'Huy@example.com', password: '12345678')
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

station_list = [
  ["Petrolimex", "10.7731904", "106.6850083"],
  ["CoderSchool Office", "10.779825", "106.692531"],
  ["Caphe Den Da", "10.778621", "106.698901"],
  ["Youth Gym", "10.781915", "106.69796"],
  ["WORK Saigon", "10.780449", "106.687962"],
  ["Vincom Center B", "10.777943", "106.701213"],
  ["24 To Go", "10.771232", "106.692958"],
  ["The Coffee House", "10.771048", "106.681261"],
  ["CirCo Coworking Space", "10.771048", "106.681261"]
]

user_list = [
  ["test1", "test1@test.com", "test1", 2500],
  ["test2", "test2@test.com", "test2", 2500],
  ["test3", "test3@test.com", "test3", 2500],
  ["test4", "test4@test.com", "test4", 2400],
  ["test5", "test5@test.com", "test5", 2300]
]

user_list.each do |name, email, password, aircredit|
  User.create( name: name, email: email, password: password, air_credit: aircredit)
end

trip_list = [
  ["1", "10.779825", "106.692531", "10.773229", "106.685301", DateTime.now - 10.minutes], #from coderschool office to petrolimex
  ["2", "10.781915", "106.69796", "10.771232", "106.692958", DateTime.now - 12.minutes], #from gym to 24 To Go
  ["3", "10.778621", "106.698901", "10.780449", "106.687962", DateTime.now - 13.minutes], #from caphedenda to WORK SAIGON
  ["1", "10.780449", "106.687962", "10.781915", "106.69796", DateTime.now - 14.minutes], #from worksaigon to gym
  ["1", "10.7731904", "106.6850083", "10.780449", "106.687962", DateTime.now - 15.minutes], #from Petrolimex to WORK SAIGON
  ["1", "10.7731904", "106.6850083", "10.781915", "106.69796", DateTime.now - 5.minutes] #from Petrolimex to gym
]

trip_list.each do |user_id, start_lat, start_long, end_lat, end_long, started_at|
  Trip.create( user_id: user_id, start_latitude: start_lat, start_longitude: start_long, end_latitude: end_lat, end_longitude: end_long, started_at: started_at)
end

trip2_list = [
  ["1", "10.779825", "106.692531", "10.773229", "106.685301", DateTime.now - 1.day], #from coderschool office to petrolimex
  ["1", "10.781915", "106.69796", "10.771232", "106.692958", DateTime.now - 1.day], #from gym to 24 To Go
  ["1", "10.778621", "106.698901", "10.780449", "106.687962", DateTime.now - 2.days], #from caphedenda to WORK SAIGON
  ["1", "10.780449", "106.687962", "10.781915", "106.69796", DateTime.now - 3.days], #from worksaigon to gym
  ["1", "10.7731904", "106.6850083", "10.780449", "106.687962", DateTime.now - 4.days], #from Petrolimex to WORK SAIGON
  ["1", "10.7731904", "106.6850083", "10.781915", "106.69796", DateTime.now - 5.days], #from Petrolimex to gym
  ["1", "10.771048", "106.681261", "10.771048", "106.681261", DateTime.now - 6.days], #cofee house to circo
  ["1", "10.771048", "106.681261", "10.777943", "106.701213", DateTime.now - 7.days], #cofee house to vincom
  ["1", "10.780449", "106.687962", "10.771048", "106.681261", DateTime.now - 4.days] #work saigon to circo
]

trip2_list.each do |user_id, start_lat, start_long, end_lat, end_long, created_at|
  Trip.create( user_id: user_id, start_latitude: start_lat, start_longitude: start_long, end_latitude: end_lat, end_longitude: end_long, created_at: created_at)
end

voucher_list = [
  ["KFC", "Food", 200, 45, 500, Date.today + 60.days, "This is a very big discount."],
  ["PT2000", "Shopping", 200, 45, 500, Date.today + 60.days, "This is a very big discount."],
  ["Uber", "Transportation", 200, 45, 500, Date.today + 60.days, "This is a very big discount."],
  ["Vietnam Airline", "Transportation", 200, 45, 500, Date.today + 60.days, "This is a very big discount."],
  ["Pizza 4Ps", "Food", 200, 45, 500, Date.today + 60.days, "This is a very big discount."]
]

voucher_list.each do |name, voucher_type, quantity, discount_info, aircredit_price, expired_at, description|
  Voucher.create(name: name, voucher_type: voucher_type, quantity: quantity, discount_info: discount_info, aircredit_price: aircredit_price, expired_at: expired_at, description: description)
end


station_list.each do |name, latitude, longitude|
  s = Station.create( name: name, latitude: latitude, longitude: longitude )
  10.times { s.bicycles.create() }  #Note: Hey Huy, do you get an error with this thing? It says 'You cannot call create unless parent is saved'
end
