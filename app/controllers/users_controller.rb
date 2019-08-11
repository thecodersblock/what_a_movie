class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_request, only: [:create, :login, :new]

  # GET /users/new
  def new
    @user = User.new(role: 'admin')
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.find_by(username: user_params[:username], password: user_params[:password], role: 'admin')

    respond_to do |format|
      if @user
        session[:current_user_id] = @user.id
        format.html { redirect_to movies_url, notice: 'Admin successfully logged in.' }
      else
        @user = User.new(role: 'admin')
        format.html { render :new, user: @user, notice: 'Invalid credentials.' }
      end
    end
  end

  def destroy
    @user = User.new(role: 'admin')
    respond_to do |format|
      format.html { redirect_to new_user_url, notice: 'Admin successfully logged out.' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
