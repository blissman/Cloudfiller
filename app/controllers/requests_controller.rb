class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to category_request_path
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
