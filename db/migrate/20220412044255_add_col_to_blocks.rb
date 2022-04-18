class AddColToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :image_url, :string
  end
end
