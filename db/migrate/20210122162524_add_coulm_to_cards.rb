class AddCoulmToCards < ActiveRecord::Migration[6.0]
  def change
  	  	add_column :cards , :user_id, :integer
  end
end
