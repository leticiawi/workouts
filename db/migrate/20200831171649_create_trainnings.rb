class CreateTrainnings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainnings do |t|
      t.string :description
      t.string :address
      t.string :duration
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
