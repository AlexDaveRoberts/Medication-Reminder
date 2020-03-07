class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show]

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save
      @individual_reminder = @reminder.create_individual_reminder(individual_reminder_params)
      if @individual_reminder.save
        redirect_to @reminder
      else
        redirect_to new_reminder_path
      end
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

  def individual_reminder_params
    params.require(:individual_reminder).permit(
      :dose1, :time1, :dose2, :time2
    )
  end
end
