class AddStatusToTodoItems < ActiveRecord::Migration
  def change
  	 add_column :todo_items, :status, :boolean, :default => 'false'
  end
end
