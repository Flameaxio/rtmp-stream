# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enum status: { offline: 0, online: 1, streaming: 2 }
  attribute :stream_configuration, StreamConfigurationType.new

  before_create -> { self.stream_key = SecureRandom.hex(16) }

  def full_name
    "#{first_name} #{last_name}"
  end

  after_commit :update_streams_list, on: %i[create update]

  private

  def update_streams_list
    if offline?
      Rails.logger.info 'Broadcasting User to streams'
      broadcast_remove_to('streams')
      return
    end
    if streaming?
      Rails.logger.info 'Broadcasting User to streams'
      broadcast_append_to('streams', target: 'streams', partial: 'home/stream', locals: { stream: self })
    end
  end
end
