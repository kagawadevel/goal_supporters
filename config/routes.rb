Rails.application.routes.draw do

  get 'timelines/index'
  get 'timelines/show'
  get 'timelines/new'
  get 'timelines/create'
  get 'timelines/edit'
  get 'timelines/update'
  get 'timelines/destroy'
  root 'users#show'
  resources :goals
  resources :users
  resources :groups
end
