class Booking < ActiveRecord::Base
  belongs_to :pool
  belongs_to :user
  has_one :user, through: :pool
end
