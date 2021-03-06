Rails.application.routes.draw do

  # Sessions allowed
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'search_articles', to:'articles#index'
  get 'filter_articles_tag', to: 'articles#filter_tags'

  # Models manipulation
  resources :users
  resources :tag_aliases
  resources :tags
  resources :portfolio
  resources :articles do
    resources :notes, only: [:index, :new, :create, :destroy]
  end

  get 'home/index'
  root 'home#index'
end
