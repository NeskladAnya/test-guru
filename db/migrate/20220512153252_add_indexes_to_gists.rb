class AddIndexesToGists < ActiveRecord::Migration[6.1]
  def change
    add_index :gists, %i[author_id question_id]
  end
end
