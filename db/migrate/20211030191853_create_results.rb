class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :grade
      t.references :user, null: false
      t.references :test, null: false

      t.timestamps
    end
  end
end
