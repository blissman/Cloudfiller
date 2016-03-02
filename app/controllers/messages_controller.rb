class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to response_path
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
    # not in use
  end

  private
  def message_params
    params.require(:message).permit(:description)
  end

end
