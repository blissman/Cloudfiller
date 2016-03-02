class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def show
    @response = Response.find(params[:id])
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new
    @response.save
    redirect_to category_request_path
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
