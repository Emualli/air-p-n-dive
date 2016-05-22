namespace :update_status do
  task update: :environment do
    SetBookingStatusToFinishedJob.perform_later
  end
end
