Rails.application.routes.draw do

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
end
