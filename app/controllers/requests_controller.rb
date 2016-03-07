class RequestsController < ApplicationController

  def index
    @active_requests = Request.where("active = ?", true).order(:number)
    @inactive_requests = Request.where("active = ?", false).order(:created_at)
    @new_request = Request.new
    # @requests = @active_requests + @inactive_requests
    # @requests = Request.all
    # for active it will always be the most recent date
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @user = current_user
    @request = Request.new(request_params)
    if @request.save
      redirect_to user_request_path
    else
      render :new
    end
  end

  def edit
    # not in use
  end

  def update
    # not in use
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to category_path
  end


private

def request_params
  params.require(:request).permit(:description, :expire, :points)
end

end
