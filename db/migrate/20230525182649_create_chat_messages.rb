# frozen_string_literal: true

class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.integer :sender_id, null: false, foreign_key: { to_table: :users }
      t.integer :receiver_id, null: false, foreign_key: { to_table: :users }
      t.string :body, null: false

      t.timestamps
    end
  end
end
