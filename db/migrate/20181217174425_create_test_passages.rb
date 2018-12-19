class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :current_question, foreign_key: true
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
