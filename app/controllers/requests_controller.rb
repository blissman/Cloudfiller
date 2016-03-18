class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update

  def index
    @user = current_user
    if @user.requests.where(active: true)
      @request = @user.requests.where(active: true).first
      @responders = User.joins(:responses).where(responses: {request_id: @request})
    end

    @inactive_requests = Request.where("user_id = ? AND active = ?", @user, false).order(created_at: :desc).page(params[:page])
    # @responders = User.joins(:responses).where(responses: {request_id: @active_request})
    # @requests = @active_requests + @inactive_requests
    # @requests = Request.all
    # for active it will always be the most recent date
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @user = current_user
    @request = Request.new
    @categories = Category.order("name")
  end

  def create
    @user = current_user
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
    @request = Request.find(params[:id])
    @request.active = params[:request][:active]
    @request.save
    @inactive_requests = Request.where(active: false).order(created_at: :desc).page(params[:page])
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
