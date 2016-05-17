class Booking < ActiveRecord::Base

  belongs_to :pool
  belongs_to :user

  validates :date, :start_time, :end_time, presence: true
end
