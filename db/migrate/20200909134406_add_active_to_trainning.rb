class AddActiveToTrainning < ActiveRecord::Migration[6.0]
  def change
    add_column :trainnings, :active, :boolean, default: true
  end
end
