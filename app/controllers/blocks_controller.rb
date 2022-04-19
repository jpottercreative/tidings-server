class BlocksController < ApplicationController
    before_action :authenticate_user!

    
    def new_block

        image_attachment = params[:image]
        gallery = Gallery.find_by!(id: params[:gallery_id])

        @block = gallery.blocks.create( block_params )
        # attach our block image if it exists
        @block.image.attach(image_attachment)
        # then to be janky, set a permanent url for it in the table so we can get it with a single call on the user side
        @block.image_url = url_for(@block.image_attachment) if @block.image.attached?
        # save the block with the updated image_url field
        @block.save
        render json: @block, status: :ok
    end

    def gallery_blocks
        gallery = Gallery.find_by!(id: params[:id])
        blocks = gallery.blocks
        # this actually just maps the URL to the url field if an image is attached
        # idea here was to dynamically fetch on a single call - it works, but 
        # i'm pretty sure it is rendered redundant with the method above
        # block_pics = blocks.all.with_attached_image
        blocks.map do |b|
            b[:image_url]=url_for(b.image) if b.image.attached?
        end
        # byebug
        render json: blocks
    end


    private
    #I couldn't get this construction to work - I wanted it to return the URL as a serialized object
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
