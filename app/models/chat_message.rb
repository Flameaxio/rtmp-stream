# frozen_string_literal: true

class ChatMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User', inverse_of: :sent_chat_messages,
                      dependent: :destroy
  belongs_to :receiver, class_name: 'User', inverse_of: :received_chat_messages,
                        dependent: :destroy

  validates :body, presence: true

  after_create_commit do
    broadcast_prepend_to(receiver,
                         :messages,
                         target: :messages,
                         partial: 'users/message',
                         locals: { message: self })
  end
end
