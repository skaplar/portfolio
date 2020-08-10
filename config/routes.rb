Rails.application.routes.draw do
  resources :tag_aliases
  resources :tags
  get 'home/index'

  resources :portfolio
  resources :articles

  root 'home#index'
end
