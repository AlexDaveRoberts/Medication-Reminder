class IndividualReminder < ApplicationRecord
  belongs_to :reminder

  def everyday_next_reminder
    times = []
    attributes.each do |attr_name, attr_value|
      if attr_name.include?("time")
        unless times.include?(attr_value)
          times << attr_value.strftime("%I:%M %P") if attr_value.present?
        end
      end
    end
    times = times.sort_by do |t|
      t.split(' ').last
    end
    times.first
  end
end
