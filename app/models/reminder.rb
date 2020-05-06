class Reminder < ApplicationRecord
  has_one :individual_reminder, dependent: :delete
  validates :medication_name, presence: true

  def started?
    start_date < DateTime.now
  end

  def repeat_ended?
    if repeat_until.present?
      repeat_until < DateTime.now
    else
      false
    end
  end
end
