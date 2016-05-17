class Pool < ActiveRecord::Base
  belongs_to :user
  has_many :agendas
  has_many :bookings
  has_attachments :photos, maximum: 5

  def average_rating
    bookings.map(&:booking_rating).reject(&:nil?).reduce(:+).fdiv(bookings.size) unless bookings.map(&:booking_rating).reject(&:nil?).empty?
  end

  def nb_booking_comment
    return bookings.map(&:booking_comment).size unless bookings.empty?
    return 0
  end
end
