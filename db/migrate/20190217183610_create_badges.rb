class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, index: true, null: false
      t.string :image, null: false
      t.string :rule

      t.timestamps
    end
  end
end
