require 'jwt'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_request
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def authenticate_request
    if(params[:controller].split('/').first != 'api')
      if User.find_by_id(session[:current_user_id])
        @current_user = User.find_by_id(session[:current_user_id])
        return true
      else
        render json: { errors: 'User does not exist' }, status: :unprocessable_entity
      end
    else
      begin
        payload = (JWT.decode request.env["HTTP_AUTHORIZATION"][7..-1], nil, false)[0]
      rescue NoMethodError, JWT::DecodeError
        render json: { errors: 'User does not exist' }, status: 401
        return
      end

      if User.find_by_id(payload["current_user_id"])
        @current_user = User.find_by_id(payload["current_user_id"])
        return true
      else
        render json: { errors: 'User does not exist' }, status: :unprocessable_entity
      end
    end
  end

end
