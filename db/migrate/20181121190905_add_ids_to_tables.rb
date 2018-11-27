class AddIdsToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :question, foreign_key: true
    add_reference :questions, :test, foreign_key: true
  end
end
