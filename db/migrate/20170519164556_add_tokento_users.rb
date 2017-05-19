class AddTokentoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :access_token, :string
    add_column :users, :ua_user_id, :string
  end
end
