class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :review
      t.references :user, null: false, foreign_key: true
      t.references :trainning, null: false, foreign_key: true

      t.timestamps
    end
  end
end
