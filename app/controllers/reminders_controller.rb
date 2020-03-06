class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show]

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save
      redirect_to @reminder
    else
      redirect_to new_reminder_path
    end
  end

  def show; end

  private

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(
      :medication_name, :medication_type,
      :num_of_times, :start_date, :repeat,
      :repeat_until, :notes
    )
  end
end
