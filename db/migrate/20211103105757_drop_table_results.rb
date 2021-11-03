class DropTableResults < ActiveRecord::Migration[6.1]
  def change
    drop_table :results, :force => true
  end
end
