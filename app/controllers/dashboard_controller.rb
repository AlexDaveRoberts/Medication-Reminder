class DashboardController < ApplicationController
  def index
    new_reminder_order = []
    upcoming_reminder_index = []
    daily_reminder_index = []
    future_reminder_index = []
    @reminders = Reminder.order(start_date: :asc)
    @reminders.each do |r|
      if !r.repeat_ended? && r.started? && r.individual_reminder.upcoming_reminder_today?
        upcoming_reminder_index << r.id
      end
    end
    todays_reminders = Reminder.find(upcoming_reminder_index).sort do |a, b|
      a.individual_reminder.everyday_next_reminder <=> b.individual_reminder.everyday_next_reminder
    end
    new_reminder_order = todays_reminders.pluck(:id)

    @reminders.where.not(id: new_reminder_order).each do |r|
      if !r.repeat_ended? && r.started?
        daily_reminder_index << r.id
      end
    end
    daily_reminders = Reminder.find(daily_reminder_index).sort do |a, b|
      a.individual_reminder.everyday_reminders.first <=> b.individual_reminder.everyday_reminders.first
    end
    new_reminder_order << daily_reminders.pluck(:id)
    new_reminder_order = new_reminder_order.flatten

    @reminders.where.not(id: new_reminder_order).each do |r|
      if !r.repeat_ended?
        future_reminder_index << r.id
      end
    end
    future_reminders = Reminder.find(future_reminder_index).sort_by(&:start_date)
    new_reminder_order << future_reminders.pluck(:id)
    new_reminder_order = new_reminder_order.flatten
    @reminders = Reminder.find(new_reminder_order).sort_by{|a| new_reminder_order.index a.id}
  end
end
