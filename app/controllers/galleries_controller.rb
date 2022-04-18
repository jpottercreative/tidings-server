class GalleriesController < ApplicationController
    before_action :authenticate_user!

    def new_gallery
        # puts current_user
        user = current_user
        #had signature errors on featured_image being passed as "undefined"  - added validation on FE too
        featured_image = params[:featured_image] if params[:featured_image]
        # start a new gallery set user_id info out of the authenticated user (as default below)
        new_gallery = Gallery.create( gallery_params )
        # attach featured_image to newly created gallery
        new_gallery.featured_image.attach(featured_image)
        # give the gallery a static URL location for now based on the active storage link
        new_gallery.featured_image_url = url_for(new_gallery.featured_image) if new_gallery.featured_image.attached?
        # save the gallery with link
        new_gallery.save
        render json: new_gallery, status: :ok
    end

    def user_galleries
        user = current_user
        galleries = user.galleries
        # galleries.map do |g|
        #     g[:featured_image_url]=url_for(g.featured_image)
        # end
        render json: galleries
    end

    def show
        # byebug
        gallery = Gallery.find_by!(id: params[:id])
        render json: gallery
    end

    def update
        gallery = Gallery.find_by!(id: params[:id])
        # byebug
        gallery.update(gallery_params)
        render json: gallery, status: :ok
    end


    private 
    def gallery_params
        default = {user_id: current_user.id}
        params.permit( :gallery, :id, :title, :description, :user_id, :featured_image, :published, :published_on, :coda, :share_url).reverse_merge(default)
    end
end
