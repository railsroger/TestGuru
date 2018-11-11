class AddDefaultValueToTests < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, 0)
  end
end
