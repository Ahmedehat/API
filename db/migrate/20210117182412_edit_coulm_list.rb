class EditCoulmList < ActiveRecord::Migration[6.0]
  def change
  	remove_column :lists , :creator, :string
  	remove_column :lists , :assigend , :array
  	add_column :lists , :user_id, :integer
  end
end
