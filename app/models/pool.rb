class Pool < ActiveRecord::Base
  belongs_to :user
  has_many :agendas
  has_many :bookings
end
