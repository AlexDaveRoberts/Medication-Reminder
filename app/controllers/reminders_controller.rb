class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show]

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save
      @reminder.update(repeat_until: params[:reminder][:repeat_until]) if @reminder.repeat != "None"
      @individual_reminder = @reminder.create_individual_reminder(individual_reminder_params)
      redirect_to @reminder
    else
      redirect_to new_reminder_path
    end
  end

  def show; end

  def confirm
    individual_reminder = IndividualReminder.find(confirm_params[:individual_id])
    individual_reminder.update(taken1: true, taken_at1: DateTime.now) if confirm_params[:time_num] == "1"
    individual_reminder.update(taken2: true, taken_at2: DateTime.now) if confirm_params[:time_num] == "2"
    individual_reminder.update(taken3: true, taken_at3: DateTime.now) if confirm_params[:time_num] == "3"
    individual_reminder.update(taken4: true, taken_at4: DateTime.now) if confirm_params[:time_num] == "4"
  end

  private

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(
      :medication_name, :medication_type, :num_of_times,
      :start_date, :repeat, :notes
    )
  end

  def individual_reminder_params
    params.require(:individual_reminder).permit(
      :dose1, :time1, :dose2, :time2,
      :dose3, :time3, :dose4, :time4
    )
  end

  def confirm_params
    params.permit(:individual_id, :time_num)
  end
end
