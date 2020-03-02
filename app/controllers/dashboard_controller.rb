class DashboardController < ApplicationController
  def index
    @reminders = Reminder.all
  end
end
