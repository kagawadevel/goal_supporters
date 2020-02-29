Rails.application.routes.draw do
  get 'group/index'
  get 'group/show'
  get 'group/new'
  get 'group/create'
  get 'group/edit'
  get 'group/update'
  get 'group/destroy'
  root 'users#show'
  resources :users
end
