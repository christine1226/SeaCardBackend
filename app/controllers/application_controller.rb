class ApplicationController < ActionController::API
  before_action :authorized

  def issue_token(payload, key)
    JWT.encode(payload, key)
  end

  def decode_token
    if get_token

      begin
        JWT.decode(get_token, 'SECRET')[0]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def get_token
    request.headers['Authorization']
  end

  def current_user
    if decode_token
      id = decode_token["user_id"]
      @user = User.find(id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
