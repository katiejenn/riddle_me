class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.string :image
      t.boolean :accepted
      t.integer :user_id
      t.integer :puzzle_id

      t.timestamps null: false
    end
  end
end
