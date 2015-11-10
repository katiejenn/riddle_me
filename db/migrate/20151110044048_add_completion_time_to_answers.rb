class AddCompletionTimeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :completion_time, :integer
  end
end
