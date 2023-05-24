# frozen_string_literal: true

class StreamConfiguration
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string, default: 'Stream Name'
end
