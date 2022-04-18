class AddCodaToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :coda, :string
  end
end
