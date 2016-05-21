class SetBookingStatusToFinishedJob < ActiveJob::Base
  queue_as :default

  def perform
    # Today's date in string :
    month = Date.today.month.to_s.length == 2 ? Date.today.month.to_s : '0' + Date.today.month.to_s
    today = Date.today.day.to_s + '/' + month + '/' + Date.today.year.to_s

    booking_to_finish = Booking.where("date = ? AND status = ?", today, 'paid')
    booking_to_finish.each do |b|
      b.status = 'finished'
      b.save
    end
  end
end
