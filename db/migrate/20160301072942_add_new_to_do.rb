class AddNewToDo < ActiveRecord::Migration
  def change
    add_column :todo_lists, :title, :string
    add_column :todo_lists, :description, :string
  end
end
