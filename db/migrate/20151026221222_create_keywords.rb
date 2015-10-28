class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :text
      t.integer :puzzle_id

      t.timestamps null: false
    end
  end
end
