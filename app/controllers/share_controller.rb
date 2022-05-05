class ShareController < ApplicationController
# this fetches our gallery by the (hopefully) random string we create on the FE

    def show
        # byebug
        share_slug = params[:id]
        gallery = Gallery.find_by!(share_url: 'https://tidings-server.herokuapp.com/share/' + share_slug )
        render json: gallery
    end

end

