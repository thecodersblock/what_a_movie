require 'jwt'

module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_request, only: [:create, :login]
  
    # GET /users
    # GET /users.json
    def index
      @users = User.all
    end
  
    # GET /users/1
    # GET /users/1.json
    def show
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users.json
    def create
      @user = User.create(username: user_params[:username], role: 'user')  
      respond_to do |format|
        if @user.save
          payload = { current_user_id: @user.id }
          @token = JWT.encode payload, nil, 'none'
          format.json { render 'users/show', status: :success }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # POST /users/login.json
    def login
      @user = User.find_by(username: user_params[:username], role: 'user')
      respond_to do |format|
        if @user
          payload = { current_user_id: @user.id }
          @token = JWT.encode payload, nil, 'none'
          format.json { render 'users/show', status: :ok }
        else
          format.json { render json: { error: 'User does not exist' }, status: :unprocessable_entity }
        end
      end
    end
  
    # POST /users/1/logout.json
    def logout
      respond_to do |format|
        format.json { render json: { message: 'User successfully logged out' } }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:username)
      end
  end  
end