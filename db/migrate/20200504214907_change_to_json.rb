class ChangeToJson < ActiveRecord::Migration[6.0]
  def change
    remove_column :individual_reminders, :taken1, :boolean
    remove_column :individual_reminders, :taken2, :boolean
    remove_column :individual_reminders, :taken3, :boolean
    remove_column :individual_reminders, :taken4, :boolean
    remove_column :individual_reminders, :taken_at1, :datetime
    remove_column :individual_reminders, :taken_at2, :datetime
    remove_column :individual_reminders, :taken_at3, :datetime
    remove_column :individual_reminders, :taken_at4, :datetime
    add_column :individual_reminders, :taken1, :json
    add_column :individual_reminders, :taken2, :json
    add_column :individual_reminders, :taken3, :json
    add_column :individual_reminders, :taken4, :json
  end
end
