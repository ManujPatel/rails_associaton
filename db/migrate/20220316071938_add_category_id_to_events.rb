class AddCategoryIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :category_id, :integer
  end
end
