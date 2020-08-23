Rails.application.routes.draw do

  resources :tag_aliases
  resources :tags
  get 'home/index'

  resources :portfolio
  resources :articles do
    resources :notes, only: [:index, :new, :create, :destroy]
  end

  root 'home#index'
end
