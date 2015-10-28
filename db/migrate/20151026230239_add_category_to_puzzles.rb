class AddCategoryToPuzzles < ActiveRecord::Migration
  def change
    add_column :puzzles, :category, :string
  end
end
