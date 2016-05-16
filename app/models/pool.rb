class Pool < ActiveRecord::Base
  belongs_to :user
  has_many :agendas, :bookings
end
