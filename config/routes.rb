Rails.application.routes.draw do

  root 'users#show'
  resources :goals
  resources :users
  resources :groups
end
