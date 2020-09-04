class AddCoordinatesToTrainnings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainnings, :latitude, :float
    add_column :trainnings, :longitude, :float
  end
end
