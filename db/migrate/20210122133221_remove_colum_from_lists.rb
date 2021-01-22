class RemoveColumFromLists < ActiveRecord::Migration[6.0]
  def change
  	    remove_column :lists , :assigend , :string
  end
end
