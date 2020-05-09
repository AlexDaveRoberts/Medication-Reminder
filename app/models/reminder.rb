class Reminder < ApplicationRecord
  has_one :individual_reminder, dependent: :delete
  validates :medication_name, presence: true
  validates :medication_type, presence: true, inclusion: { in: ["Drop", "Injection", "Syrup", "Tablet"] }
  validates :num_of_times, presence: true
  validates :start_date, presence: true


  def started?
    start_date < DateTime.now + 1.hour
  end

  def repeat_ended?
    if repeat_until.present?
      repeat_until < DateTime.now + 1.hour
    else
      false
    end
  end
end
