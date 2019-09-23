Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :books, only: %i[new create index show edit update destroy]
    get 'stats', to: 'pages#stats', as: 'stats'
  end

  resources :search, only: [:index]

  get 'authors/new', to: 'authors#new', as: 'authors_new'
  post 'authors/create', to: 'authors#create', as: 'authors_create'
  get 'authors/show/:id', to: 'authors#show', as: 'author'

  get 'quotes/new', to: 'quotes#new', as: 'new_quote'
  post 'quotes/create', to: 'quotes#create', as: 'create_quote'

  get 'stats/barchart', to: 'stats#barchart', as: 'barchart'
end
