class AddPriceToTrainnings < ActiveRecord::Migration[6.0]
  def change
    add_monetize :trainnings, :price, currency: { present: false }

  end
end
