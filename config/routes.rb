Rails.application.routes.draw do

  get 'praises/update'
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
  resources :user_group_relations, only: %i[index create destroy]
  resources :praises, only: %i[update]
end
