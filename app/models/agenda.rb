class Agenda < ActiveRecord::Base
  belongs_to :pool
  validates :start_date, presence: true

  def start_time
    instancifyDate(self.start_date)
  end

  private

  def instancifyDate(date)
    date_array = date.split('/').map { |d| d.to_i }
    Date.new(date_array[2], date_array[1], date_array[0])
  end
end
