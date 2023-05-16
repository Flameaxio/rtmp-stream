# frozen_string_literal: true

class Api::V1::StreamsController < Api::ApplicationApiController
  def stream
    Rails.logger.info('Hit stream endpoint!')
    render json: { message: 'Hello from the stream endpoint!' }, status: :ok
  end
end
