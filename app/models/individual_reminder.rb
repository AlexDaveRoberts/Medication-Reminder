class IndividualReminder < ApplicationRecord
  belongs_to :reminder

  def everyday_next_reminder
    times = []
    attributes.each do |attr_name, attr_value|
      if attr_name.include?("time")
        unless times.include?(attr_value)
          times << attr_value.strftime("%H:%M") if attr_value.present?
        end
      end
    end
    times.sort.each do |t|
      return t if t > DateTime.now.strftime("%H:%M")
    end
  end

  def everyday_reminders
    times = []
    attributes.each do |attr_name, attr_value|
      if attr_name.include?("time")
        unless times.include?(attr_value)
          times << attr_value.strftime("%H:%M") if attr_value.present?
        end
      end
    end
    times.sort
  end

  def upcoming_reminder_today?
    upcoming = false
    everyday_reminders.each do |time|
      upcoming = true if time > DateTime.now.strftime("%H:%M")
    end
    return upcoming
  end
end
