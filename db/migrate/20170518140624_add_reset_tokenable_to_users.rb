class AddResetTokenableToUsers < ActiveRecord::Migration[5.0]
  def change
  
    add_column :users, :reset_token, :string, default: nil
    add_column :users, :reset_created_at, :timestamp, default: nil
    add_column :users, :reset_sent_at, :timestamp, default: nil
    add_column :users, :reset_completed_at, :timestamp, default: nil

    add_index :users, :reset_token
  
  end
end
