class ConversationsController < ApplicationController

def index
  @users = User.all
  @conversations = Conversation.all

  respond_to do |format|
    format.html { }
    format.js {  }
  end

end

def create
  @request = Request.find(params[:request_id])
  if Conversation.between(params[:sender_id],params[:recipient_id]).where("request_id = ?", @request).present?
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).where("request_id = ?", @request).first
  else
    @conversation = Conversation.create!(conversation_params)
    @conversation.create_activity :create, owner: current_user, recipient: User.find(@conversation.recipient_id)
  end

  respond_to do |format|
    format.html { }
    format.js {  }
  end

  # redirect_to request_conversation_messages_path(@request, @conversation)
end

private
  def conversation_params
    params.permit(:sender_id, :recipient_id, :request_id)
  end
end
