# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
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
  ["24 To Go", "10.771232", "106.692958"]
]

station_list.each do |name, latitude, longitude|
  s = Station.create( name: name, latitude: latitude, longitude: longitude )
  10.times { s.bicycles.create() }
end

user_list = [
  ["test1", "test1@test.com", "test1"],
  ["test2", "test2@test.com", "test2"],
  ["test3", "test3@test.com", "test3"]
]

user_list.each do |name, email, password|
  User.create( name: name, email: email, password: password )
end

trip_list = [
  ["1", "10.779825", "106.692531", "10.773229", "106.685301"], #from coderschool office to petrolimex
  ["2", "10.781915", "106.69796", "10.771232", "106.692958"], #from gym to 24 To Go
  ["3", "10.778621", "106.698901", "10.780449", "106.687962"], #from caphedenda to WORK SAIGON
  ["1", "10.780449", "106.687962", "10.781915", "106.69796"] #from worksaigon to gym
]

trip_list.each do |user_id, start_lat, start_long, end_lat, end_long|
  Trip.create( user_id: user_id, start_latitude: start_lat, start_longitude: start_long, end_latitude: end_lat, end_longitude: end_long )
end
