class AddAnswersCorrectNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :title, false )
    change_column_null(:answers, :correct, false)
  end
end
