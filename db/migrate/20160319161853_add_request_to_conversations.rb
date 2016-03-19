class AddRequestToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :request_id, :integer
  end
end
