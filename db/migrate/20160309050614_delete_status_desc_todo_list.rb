class DeleteStatusDescTodoList < ActiveRecord::Migration
  def change
  	remove_column :todo_lists, :status, :description
  end
end
