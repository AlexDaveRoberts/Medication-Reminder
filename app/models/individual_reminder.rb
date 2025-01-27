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
      return t if t > (DateTime.now + 1.hour).strftime("%H:%M")
    end
  end

  def everyday_reminders(sort = false)
    times = []
    attributes.each do |attr_name, attr_value|
      if attr_name.include?("time")
        unless times.include?(attr_value)
          times << attr_value.strftime("%H:%M") if attr_value.present?
        end
      end
    end
    if sort == true
      return times.sort
    else
      return times
    end
  end

  def upcoming_reminder_today?
    upcoming = false
    everyday_reminders.each do |time|
      upcoming = true if time > (DateTime.now + 1.hour).strftime("%H:%M")
    end
    return upcoming
  end
end
