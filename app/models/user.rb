class User < ActiveRecord::Base
  has_many :bookings, :pools
end
