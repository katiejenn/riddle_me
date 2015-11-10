class AddStartTimeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :start_time, :integer
  end
end
