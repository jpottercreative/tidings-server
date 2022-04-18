class Users::SessionsController < Devise::SessionsController
    respond_to :json
  
    private
    def current_token
      request.env['warden-jwt_auth.token']
    end
  
    def respond_with(resource, _opts = {})
      @token = current_token
      render json: { message: 'You are logged in.', token: @token, id: current_user.id, avatar: current_user.avatar.url }, status: :ok
    end
  
    def respond_to_on_destroy
      log_out_success && return if current_user
  
      log_out_failure
    end
  
    def log_out_success
      render json: { message: "You are logged out." }, status: :ok
    end
  
    def log_out_failure
      render json: { message: "Hmm nothing happened."}, status: :unauthorized
    end
  end

  # def create
  #   super { @token = current_token }
  # end

  # def current_token
  #   request.env['warden-jwt_auth.token']
  # end