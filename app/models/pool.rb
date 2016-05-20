class Pool < ActiveRecord::Base
  belongs_to :user
  has_many :agendas
  has_many :bookings
  has_attachments :photos, minimum: 1, maximum: 5

  validates :width, :length, :depth, :shape, :location, :water_type, :equipments, :description, :price, :title, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def average_rating
    bookings.map(&:booking_rating).reject(&:nil?).reduce(:+).fdiv(bookings.map(&:booking_rating).reject(&:nil?).size) unless bookings.map(&:booking_rating).reject(&:nil?).empty?
  end

  def nb_booking_comment
    return bookings.map(&:booking_comment).reject(&:nil?).count unless bookings.empty?
    return 0
  end
end
