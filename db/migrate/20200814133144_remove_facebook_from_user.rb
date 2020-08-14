class RemoveFacebookFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :facebook
  end
end
