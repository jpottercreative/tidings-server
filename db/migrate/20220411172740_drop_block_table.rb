class DropBlockTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :blocks
  end
end
