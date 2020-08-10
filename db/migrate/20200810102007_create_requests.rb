class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|

      t.string :status

      t.timestamps

      t.references  :user, foreign_key: true
      t.references  :event, foreign_key: true
    end
  end
end
