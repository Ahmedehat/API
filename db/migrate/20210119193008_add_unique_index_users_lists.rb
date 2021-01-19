class AddUniqueIndexUsersLists < ActiveRecord::Migration[6.0]
  def change
    add_index :users_lists, [:user_id, :list_id], unique: true
  end
end
