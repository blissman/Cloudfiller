class ConversationsController < ApplicationController

def index
  @users = User.all
  @conversations = Conversation.all
end

def create
  @request = Request.find(params[:request_id])
  if Conversation.between(params[:sender_id],params[:recipient_id]).present?
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  else
    @conversation = Conversation.create!(conversation_params)
  end

  redirect_to request_conversation_messages_path(@request, @conversation)
end

private
  def conversation_params
    params.permit(:sender_id, :recipient_id, :request_id)
  end
end
