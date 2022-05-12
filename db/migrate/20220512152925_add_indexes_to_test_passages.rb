class AddIndexesToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_index :test_passages, %i[user_id test_id]
  end
end
