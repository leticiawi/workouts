class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :amount, :integer, default: 0, null: false
    add_column :orders, :state, :string
    add_column :orders, :checkout_session_id, :string
  end
end
