class AddLoginAndPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :password_digest, :string
  end
end
