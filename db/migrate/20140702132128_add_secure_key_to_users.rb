class AddSecureKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secure_key, :string
    add_index  :users, :secure_key
  end
end
