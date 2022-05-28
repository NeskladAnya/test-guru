class AddRequiredAttributesForTimer < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_in_min, :integer
    add_column :test_passages, :deadline, :datetime
  end
end
