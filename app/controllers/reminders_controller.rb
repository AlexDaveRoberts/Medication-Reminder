class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]

  def new
    @reminder = Reminder.new
    render "form"
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save && @reminder.create_individual_reminder(individual_reminder_params)
      flash[:success] = "This new medication reminder has been successfully created."
      redirect_to @reminder
    else
      error_message = "There was an error creating this medication reminder. The "
      invalid_fields = @reminder.errors.messages
      error_message << "medication name, " if invalid_fields.include?(:medication_name)
      error_message << "medication type, " if invalid_fields.include?(:medication_type)
      error_message << "number of times, " if invalid_fields.include?(:num_of_times)
      error_message << "start date, " if invalid_fields.include?(:start_date)
      flash[:error] = error_message + "are required."
      redirect_to new_reminder_path
    end
  end

  def show; end

  def edit
    render "form"
  end

  def update
    if @reminder.update(reminder_params)
      @reminder.update(repeat_until: params[:reminder][:repeat_until]) if @reminder.repeat != "None"
      @individual_reminder = @reminder.individual_reminder.update(individual_reminder_params)
      flash[:success] = "This medication reminder has been successfully updated."
      redirect_to @reminder
    else
      flash[:error] = "There was an error updating this medication reminder."
      redirect_to edit_reminder_path(@reminder)
    end
  end

  def destroy
    if @reminder.destroy
      flash[:success] = "This medication reminder has been successfully deleted."
      redirect_to root_path
    end
  end

  def confirm
    individual_reminder = IndividualReminder.find(confirm_params[:individual_id])
    if confirm_params[:time_num] == "1"
      current_value = individual_reminder.taken1
      if current_value != nil
        current_value = current_value.merge({"date_#{individual_reminder.taken1.keys.last.split(/\_/).last.to_i + 1}": DateTime.now + 1.hour})
      else
        current_value = {date_1: DateTime.now + 1.hour}
      end
      individual_reminder.update(taken1: current_value)
    elsif confirm_params[:time_num] == "2"
      current_value = individual_reminder.taken2
      if current_value != nil
        current_value = current_value.merge({"date_#{individual_reminder.taken2.keys.last.split(/\_/).last.to_i + 1}": DateTime.now + 1.hour})
      else
        current_value = {date_1: DateTime.now + 1.hour}
      end
      individual_reminder.update(taken2: current_value)
    elsif confirm_params[:time_num] == "3"
      current_value = individual_reminder.taken3
      if current_value != nil
        current_value = current_value.merge({"date_#{individual_reminder.taken3.keys.last.split(/\_/).last.to_i + 1}": DateTime.now + 1.hour})
      else
        current_value = {date_1: DateTime.now + 1.hour}
      end
      individual_reminder.update(taken3: current_value)
    elsif confirm_params[:time_num] == "4"
      current_value = individual_reminder.taken4
      if current_value != nil
        current_value = current_value.merge({"date_#{individual_reminder.taken4.keys.last.split(/\_/).last.to_i + 1}": DateTime.now + 1.hour})
      else
        current_value = {date_1: DateTime.now + 1.hour}
      end
      individual_reminder.update(taken4: current_value)
    end
    flash[:success] = "This medication reminder has been successfully marked as taken."
  end

  private

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(
      :medication_name, :medication_type, :num_of_times,
      :start_date, :repeat, :repeat_until, :notes
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
