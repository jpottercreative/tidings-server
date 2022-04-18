class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.boolean :published
      t.date :published_on

      t.timestamps
    end
  end
end
