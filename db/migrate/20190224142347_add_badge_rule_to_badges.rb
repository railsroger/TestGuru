class AddBadgeRuleToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule_value, :string
  end
end
