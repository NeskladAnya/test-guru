class RenameTestPassageColumn < ActiveRecord::Migration[6.1]
  def change
    change_table :test_passages do |t|
      t.rename :result, :passed
    end
  end
end
