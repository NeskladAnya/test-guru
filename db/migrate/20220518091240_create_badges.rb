class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description
      t.string :key, null: false
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
