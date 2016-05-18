class Booking < ActiveRecord::Base

  belongs_to :pool
  belongs_to :user

  validates :date, :start_time, :end_time, presence: true

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
