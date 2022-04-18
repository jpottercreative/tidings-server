class UsersController < ApplicationController
    before_action :authenticate_user!

    
    def index
        users = User.all
        render json: users
    end
    def show
        # byebug
        render json: {message: "you're in", user: current_user, avatar: show_avatar}
    end
    def add_profile_photo
        # user = User.find_by!(id: params[:id])
        # byebug
        current_user.avatar.attach(params[:avatar])
        render json: {user: current_user, avatar: show_avatar}, status: :ok
    end

    private
    def user_params
        params.permit(:email, :password, :avatar)
    end
    def show_avatar
        if current_user.avatar.attached?
            host = "http://localhost:3000"
            return host + rails_blob_path(current_user.avatar, disposition: "attachment")
        else 
            return
        end
    end
    def current_token
        request.env['warden-jwt_auth.token']
    end
end
