Rails.application.routes.draw do

  get 'goals/index'
  get 'goals/show'
  get 'goals/new'
  get 'goals/create'
  get 'goals/edit'
  get 'goals/update'
  get 'goals/destroy'
  root 'users#show'
  resources :users
  resources :groups
end
