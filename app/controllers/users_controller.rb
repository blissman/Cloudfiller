class UsersController < ApplicationController

  def index
    # not in use
  end

  def show
    @user = User.find(params[:id])  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
       if @user.update_attributes(user_params)
         redirect_to user_path
       else
         render :edit
       end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation)
  end

end
