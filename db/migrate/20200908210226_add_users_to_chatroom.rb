class AddUsersToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :user, null: false, foreign_key: true
    add_column :chatrooms, :trainer_id, :integer
  end
end
