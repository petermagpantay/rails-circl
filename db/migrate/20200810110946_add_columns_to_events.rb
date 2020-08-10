class AddColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_date, :datetime
    add_column :events, :event_time, :datetime
  end
end
