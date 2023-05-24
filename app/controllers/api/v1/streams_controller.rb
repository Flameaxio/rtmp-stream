# frozen_string_literal: true

class Api::V1::StreamsController < Api::ApplicationApiController
  def stream
    user = User.find_by(stream_key: params[:name])
    render(json: { message: 'User not found' }, status: :not_found) && return unless user

    user.streaming!

    render(json: { message: 'OK' }, status: :ok)
  end

  def stream_done
    user = User.find_by(stream_key: params[:name])
    render(json: { message: 'User not found' }, status: :not_found) && return unless user

    user.offline!

    render(json: { message: 'OK' }, status: :ok)
  end
end
