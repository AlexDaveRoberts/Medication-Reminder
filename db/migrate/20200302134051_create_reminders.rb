class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :medication_name
      t.string :medication_type
      t.integer :num_of_times
      t.datetime :start_date
      t.string :repeat
      t.datetime :repeat_until
      t.text :notes
      t.integer :individual_reminder_id
      t.timestamps
    end
  end
end
