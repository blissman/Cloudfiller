class ResponsesController < ApplicationController

  def index
    @responses = Response.all.where(user: current_user)
  end

  def show
    @response = Response.find(params[:id])
  end

  def new
    @response = Response.new
  end

  def create
    @request = Request.find(params[:request_id])
    @response = Response.new
    @response.user = current_user
    @response.request = @request
    @response.save

    respond_to do |format|
        format.js {}
        format.html {}
    end

  end

  def edit
    # not in use
  end

  def update
    # not in use
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destory
    redirect_to user_path
  end

end
