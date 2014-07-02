class AddSecureTokenToUsers < ActiveRecord::Migration
  def change
  add_column :users, :secure_token, :string
  add_index  :users, :secure_token
  end
end
