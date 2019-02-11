class AddForeignKeyToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, index: false
    add_foreign_key :tests, :users, column: :author_id
    add_foreign_key :answers, :questions
    add_foreign_key :gists, :questions
    add_foreign_key :gists, :users
    add_foreign_key :questions, :tests
    add_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :users 
  end
end
