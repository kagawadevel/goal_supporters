Rails.application.routes.draw do

  get 'boards/index'
  get 'boards/show'
  get 'boards/new'
  get 'boards/create'
  get 'boards/edit'
  get 'boards/update'
  get 'boards/destroy'
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'groups#index'
  resources :goals
  resources :users
  resources :groups
  resources :timelines
end
