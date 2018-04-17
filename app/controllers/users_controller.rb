class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

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

  # POST /users
  # POST /users.json
  def create
    #complete this method
    new_user = User.create(user_params)
    if new_user.errors.any?
      flash.now[:error]= "Some invalid data in the fields, please try it again"
      render action: new

    else
      flash[:success] = "User "+new_user.name+" "+new_user.last_name+" was created successfully!"
      redirect_to user_path(id=new_user.id)

    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user=set_user

    user.update(user_params)
    if user.errors.any?
      flash.now[:error]= "Some invalid data in the fields, please try it again"
      render :edit

    else
      flash[:success] = "User edited successfully!"
      redirect_to user_path(user.id)

    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
