# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'admin1',email: 'admin1@test.com',password: 'admin1', type: 'Admin',latitude: '+48.987386',longitude: '0')

p "Created #{User.count} User"