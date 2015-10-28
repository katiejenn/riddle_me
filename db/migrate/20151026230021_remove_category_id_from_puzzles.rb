class RemoveCategoryIdFromPuzzles < ActiveRecord::Migration
  def change
  	 remove_column :puzzles, :category_id, :integer
  end
end
