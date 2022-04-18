class ShareController < ApplicationController

    def show
        # byebug
        share_slug = params[:id]
        gallery = Gallery.find_by!(share_url: 'http://localhost:3006/share/' + share_slug )
        render json: gallery
    end

end

