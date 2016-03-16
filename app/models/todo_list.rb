class TodoList < ActiveRecord::Base
		  validates :title, presence: true, length: { maximum: 20 }
		  belongs_to :user
		  has_many :todo_items
end
