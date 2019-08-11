class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_request
  protect_from_forgery with: :null_session

  def authenticate_request
    if User.find_by_id(session[:current_user_id])
      @current_user = User.find_by_id(session[:current_user_id])

      return true
    else
      render json: { errors: 'User does not exist' }, status: :unprocessable_entity
    end
  end
end
