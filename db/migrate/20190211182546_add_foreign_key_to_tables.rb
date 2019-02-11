class AddForeignKeyToTables < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tests, :author
    add_reference :tests, :author, foreign_key: { to_table: :users}
    add_foreign_key :answers, :questions
    add_foreign_key :gists, :questions
    add_foreign_key :gists, :users
    add_foreign_key :questions, :tests
    add_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :users 
  end
end
