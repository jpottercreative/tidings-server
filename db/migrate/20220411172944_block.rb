class Block < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.belongs_to :gallery, null: false, foreign_key: true
      t.string :block_type
      t.string :text
      t.string :bg_color
      t.string :font_color
      t.string :font_size
      t.string :font
      t.string :text_align
      t.string :text_location
      t.string :width

      t.timestamps
    end
  end
end
