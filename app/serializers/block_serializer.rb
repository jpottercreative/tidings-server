class BlockSerializer < ActiveModel::Serializer
  attributes :id, :gallery_id, :block_type, :text, :bg_color, :font_color, :font_size, :font, :text_align, :text_location, :width, :image_url
  belongs_to :gallery
 
 
  # def image_url
  #   url_for(block.image_attachment) if block.image.attached?
  # end
  # def image_url
  #   rails_blob_path(block.image, only_path: true) if blocks.image.attached?
  # end

end
