Rails.application.routes.draw do

  get 'user_group_relations/index'
  get 'user_group_relations/create'
  get 'user_group_relations/destroy'
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
  resources :comments
end
