class ResponsesController < ApplicationController

  def index
    @requests = Request.joins(:responses).where(responses: {user_id: current_user}, requests: {active: true})
    @oldrequests = Request.joins(:responses).where(responses: {user_id: current_user}, requests: {active: false}).page(params[:page])
  end

  def show
    @response = Response.find(params[:id])
  end

  def new
    @response = Response.new
  end

  def create
    if Request.joins(:responses).where(responses: {user_id: current_user}, requests: {active: true}).length < 3

      @request = Request.find(params[:request_id])
      @response = Response.new
      @response.user = current_user
      @response.request = @request
      @response.save

      respond_to do |format|
          format.js { }
          format.html { redirect_to category_request_path }
      end

    else
      flash[:alert] = "Oops! You already have 3 active responses. You need to complete one before adding another."
    end

  end

  def edit
    # not in use
  end

  def update
    # not in use
  end

  def destroy
    # @request = Request.find(params[:id])
    # @request.response = Response.find(params[:id])
    # @response = Response.find(params[:id])
  
    @request = Request.find(params[:request_id])
    @response.destroy
    redirect_to responses_path
  end

end
