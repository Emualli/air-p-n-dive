class Booking < ActiveRecord::Base

  attr_accessor :location

  belongs_to :pool
  belongs_to :user
end
