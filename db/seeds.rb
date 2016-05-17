# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Pool.create(description: 'nice pool', location: 'Paris', width: 3, user_id: 1)
Pool.create(description: 'very nice pool', location: 'London', width: 3, user_id: 1)
Pool.create(description: 'blue pool', location: 'London', width: 3, user_id: 1)
Pool.create(description: 'green pool', location: 'Amsterdam', width: 3, user_id: 1)
Pool.create(description: 'purple pool', location: 'Amsterdam', width: 3, user_id: 1)
Pool.create(description: 'red pool', location: 'Amsterdam', width: 3, user_id: 1)
