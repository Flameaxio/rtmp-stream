# frozen_string_literal: true
class ExpandUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.integer :status, default: 0
      t.json :stream_configuration, default: {}
      t.string :stream_key
      t.string :first_name
      t.string :last_name
      t.string :handle

      t.index :status
      t.index :stream_key
    end
  end
end
