# frozen_string_literal: true

class Api::V1::StreamsController < Api::ApplicationApiController
  before_action :find_user

  UPDATE_PATHS = {
    'opening' => ->(user) { user.streaming! },
    'closing' => ->(user) { user.offline! }
  }.freeze

  def update_stream
    unless UPDATE_PATHS.key?(request_params[:status])
      Rails.logger.info("Action not found: #{request_params[:status]}")
      render(json: { message: 'Action not found' }, status: :not_found) && return
    end

    UPDATE_PATHS[request_params[:status]].call(@user)

    Rails.logger.info("Routing to: #{stream_url}")
    render(json: { allowed: true, new_url: stream_url }, status: :ok)
  end

  private

  def request_params
    params[:request]
  end

  def stream_url
    @_stream_url ||= begin
      incoming_url = URI::parse(request_params[:url].to_s)
      incoming_url.path = ['', 'app', @user.handle].join('/')
      incoming_url.scheme = 'rtmp'
      incoming_url.to_s
    end
  end

  def find_user
    key = URI::parse(request_params[:url].to_s).path.split('/').last
    @user = User.find_by!(stream_key: key)
  end
end
