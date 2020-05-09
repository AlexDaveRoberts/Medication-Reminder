class Reminder < ApplicationRecord
  has_one :individual_reminder, dependent: :delete
  validates :medication_name, presence: true

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
