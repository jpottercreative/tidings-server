class AddUrlToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :featured_image_url, :string
  end
end
