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

Booking.create(pool_id: 1, user_id: 1, status: "accepted", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "rejected", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "created", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "cancelled", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "paid", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "closed", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "reviewed", booking_comment: "de la balle", booking_rating: 4, customer_rating: 2, customer_comment: "ouais", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "reviewed", booking_comment: "chanmé", booking_rating: 2, customer_rating: 1, customer_comment: "chiant", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "reviewed", booking_comment: "cool", booking_rating: 5,ustomer_rating: 4, customer_comment: "super", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "reviewed", booking_comment: "super", booking_rating: 1, customer_rating: 3, customer_comment: "sympa", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
Booking.create(pool_id: 1, user_id: 1, status: "reviewed", booking_comment: "trop chiant", booking_rating: 3, customer_rating: 5, customer_comment: "mauvais", date: "01/06/2016", price: 40, start_time: "12/00", end_time: "19:00")
