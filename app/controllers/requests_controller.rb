class RequestsController < ApplicationController


  def index
    @active_request = Request.find_by("active = ?", true)
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
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @request = Request.new(request_params)
    @request.user = current_user
    # @active_request = Request.update("active = ?", true)
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @active_request = Request.find(params[:id])
    @active_request.update_attributes(request_params)
    redirect_to user_requests_path
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to category_path
  end


private

def request_params
  params.require(:request).permit(:description, :expire, :points, :active, :category_id)
end

end
