class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update

  def index
    @user = current_user
    @active_request = Request.find_by("active = ? AND user_id = ?", true, @user)
    @inactive_requests = Request.where("active = ? AND user_id = ?", false, @user).order(created_at: :desc).page(params[:page])
    @new_request = Request.new
    @responders = User.joins(:responses).where(responses: {request_id: @active_request})
    # @requests = @active_requests + @inactive_requests
    # @requests = Request.all
    # for active it will always be the most recent date
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    @categories = Category.order("name")
  end

  def create
    @categories = Category.order("name")
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.order("name")
  end

  def update
    # byebug
    @active_request = Request.find(params[:id])
    @active_request.update_attributes(request_params)
    # render js: "update"

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {}
    end
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
