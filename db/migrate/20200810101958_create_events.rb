
class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      
      t.string :title
      t.string :description
      t.string :location
      t.datetime :event_date
      t.datetime :event_time

      t.timestamps

      t.references  :user, foreign_key: true

    end
  end
end
