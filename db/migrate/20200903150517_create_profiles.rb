class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :speciality
      t.integer :age
      t.text :bio
      t.string :certifications
      t.string :achievments
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
