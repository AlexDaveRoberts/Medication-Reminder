class CreateIndividualReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :individual_reminders do |t|
        t.integer :reminder_id
        t.string :dose1
        t.datetime :time1
        t.boolean :taken1
        t.datetime :taken_at1
        t.string :dose2
        t.datetime :time2
        t.boolean :taken2
        t.datetime :taken_at2
        t.string :dose3
        t.datetime :time3
        t.boolean :taken3
        t.datetime :taken_at3
        t.string :dose4
        t.datetime :time4
        t.boolean :taken4
        t.datetime :taken_at4
      t.timestamps
    end
  end
end
