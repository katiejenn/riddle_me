class AddEndTimeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :end_time, :integer
  end
end
