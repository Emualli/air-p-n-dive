namespace :booking do
  desc "Change user status after booking is passed"
  task change_status: :environment do
    SetBookingStatusToFinishedJob.perform_later
  end
end
