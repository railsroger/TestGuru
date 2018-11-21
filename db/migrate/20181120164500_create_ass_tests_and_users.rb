class CreateAssTestsAndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :ass_tests_and_users do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
    end
  end
end
