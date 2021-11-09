class CreateResultsWithRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :test, null: false, foreign_key: true
      t.integer :grade
      t.timestamps
    end
  end
end