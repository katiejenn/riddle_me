class AddStartTimeToPuzzles < ActiveRecord::Migration
  def change
    add_column :puzzles, :start_time, :integer
  end
end
