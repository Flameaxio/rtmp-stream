# frozen_string_literal: true

class ChatMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    ChatMessage.create!(chat_message_params)
  end

  private

  def chat_message_params
    {
      sender_id: User.last.id,
      receiver_id: params[:user_id],
      body: params[:body]
    }
  end
end
