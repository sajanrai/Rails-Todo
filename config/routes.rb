Rails.application.routes.draw do
  devise_for :users
  get 'todo_items/updateStatus'
  get 'todo_items/destroy'
  get 'todo_lists/destroy'
  resources :todo_lists do
  resources :todo_items
  end
  root 'todo_lists#index'
end
