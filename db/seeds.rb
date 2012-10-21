# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Guest', :email => 'guest@dnttm.ru', :password => 'theguest', :password_confirmation => 'theguest'
user.confirm!
puts 'New user created: ' << user.name

user2 = User.create! :name => 'Fedor Vompe', :email => 'fvompe@dnttm.ru', :password => '314159', :password_confirmation => '314159'
user2.confirm!
puts 'Admin created: ' << user2.name
user2.add_role :admin
