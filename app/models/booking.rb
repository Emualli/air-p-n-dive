class Booking < ActiveRecord::Base

  belongs_to :pool
  belongs_to :user

  validates :date, :start_time, :end_time, presence: true

  def isValidForSaving?
    # Fetch necessary instances & variables related to the booking passed in argument
    pool = Pool.find(self.pool_id)
    @agendas_for_this_pool = Agenda.where('pool_id = ?', pool.id)
    booking_date_instance = instancifyDate(self.date)

    # 1st check : is available in Agendas -- STARTDATE
    @agendas_for_this_pool.map{ |a| [instancifyDate(a.start_date), instancifyDate(a.end_date)] }.each do |d|
      return true if (booking_date_instance >= d[0] && booking_date_instance <= d[1])
    end
    false

    # 2nd check : Doesn't overlap any other booking
    # all_bookings_for_this_pool = Booking.where("pool_id = ?", pool.id)
  end

  def instancifyDate
    date = self.date
    date_array = date.split('/').map { |d| d.to_i }
    Date.new(date_array[2], date_array[1], date_array[0])
  end

  def get_status_msg
    current_status = {
      created: "Pending validation by owner",
      accepted: "You can now pay the owner to complete your booking",
      rejected: "Your dive has been rejected by owner, too bad :(",
      cancelled: "This booking has been cancelled",
      paid: "Owner has received your payment, happy dive!",
      closed: "Please, add a review to rate your experience",
      reviewed: "Thank you for reviewing your dive !"
    }

    return current_status[status.to_sym]
  end

  def get_action_msg
    current_action = {
      accepted: "Pay now",
      closed: "Add a review"
    }

    return current_action[status.to_sym]
  end
end
