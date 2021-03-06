class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:root)
    else
      flash.now[:alert] = 'Invalid Username or Password'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root)
  end
end
