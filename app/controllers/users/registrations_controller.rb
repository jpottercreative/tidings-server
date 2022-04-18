class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def current_token
      request.env['warden-jwt_auth.token']
    end

    def respond_with(resource, _opts = {})
      # byebug
      register_success && return if resource.persisted?
  
      register_failed
    end
  
    def register_success
      @token = current_token
      render json: { message: 'Signed up sucessfully.', user: current_user, token: @token, id: current_user.id, status: :ok}
    end
  
    def register_failed
      # byebug
      render json: { message: "Something went wrong.", status: :forbidden }
    end
    
  end