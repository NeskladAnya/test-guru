class AddRuleToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_type, :string
    add_column :badges, :rule_value, :string
    add_column :test_passages, :result, :boolean

    remove_column :badges, :key, if_exists: true
  end
end
