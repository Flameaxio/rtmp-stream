# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @messages = @user.received_chat_messages.order(created_at: :desc).preload(:sender).limit(20)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
