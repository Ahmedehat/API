class AddAssignedToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :assigend, :string
  end
end
