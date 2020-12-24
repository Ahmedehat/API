class RemoveCoulmFromUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    remove_column :users , :name, :string
	remove_column :users , :image, :string
    remove_column :users , :nickname , :string
  end
end
