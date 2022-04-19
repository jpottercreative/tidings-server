class MembersController < ApplicationController
    before_action :authenticate_user!
  
    # this was the initial sanity check controller for Devise
    # we are now using it to authenticate users and send their gallery list and avatar

    def show
      render json: { message: "If you see this, you're in!", user: current_user, avatar: avatar}
    end
  end