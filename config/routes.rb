Rails.application.routes.draw do

  get 'comments/index'
  get 'comments/new'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'groups#index'
  resources :goals
  resources :users
  resources :groups
  resources :timelines
  resources :boards
end
