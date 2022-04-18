class BlocksController < ApplicationController
    before_action :authenticate_user!

    def new_block

        image_attachment = params[:image]
        gallery = Gallery.find_by!(id: params[:gallery_id])

        @block = gallery.blocks.create( block_params )
        @block.image.attach(image_attachment)
        @block.image_url = url_for(@block.image_attachment) if @block.image.attached?
        @block.save
        render json: @block, status: :ok
    end

    def gallery_blocks
        gallery = Gallery.find_by!(id: params[:id])
        blocks = gallery.blocks
        # block_pics = blocks.all.with_attached_image
        blocks.map do |b|
            b[:image_url]=url_for(b.image) if b.image.attached?
        end
        # byebug
        render json: blocks
    end


    private
    # def show_block_image
    #     if block.image.attached?
    #         host = "http://localhost:3000"
    #         return host + rails_blob_path(block.image, disposition: "attachment")
    #     else 
    #         return
    #     end
    # end

    def block_params
        params.permit(:gallery_id, :block_type, :text, :image, :bg_color, :font, :font_color, :font_size, :width, :text_align, :text_location )
    end

end
