class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique
# this rescue is one of the few - custom so that we are sending the right code and capturing it right on the FE
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :avatar, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :email, :password])

    end

    def render_not_unique(exception)
      render json: { error: {statusText: "User Exists", status: 403 }}, status: :forbidden
      # byebug

    end
end
