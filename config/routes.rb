Rails.application.routes.draw do
  get '/users/show:id', to: 'users#show', as: 'user'

  resources :posts, only: [:index, :create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
