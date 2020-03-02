class Reminder < ApplicationRecord
  has_one :individual_reminder
  validates :medication_name, presence: true
end
