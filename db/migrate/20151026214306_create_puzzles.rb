class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :text
      t.string :image
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
