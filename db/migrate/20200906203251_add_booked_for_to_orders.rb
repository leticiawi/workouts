class AddBookedForToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :Booked_for, :datetime
  end
end
