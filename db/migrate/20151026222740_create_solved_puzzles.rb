class CreateSolvedPuzzles < ActiveRecord::Migration
  def change
    create_table :solved_puzzles do |t|
      t.integer :user_id
      t.integer :puzzle_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
