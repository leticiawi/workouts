class Category < ApplicationRecord
  def index
    @category = Category.all
  end
end
