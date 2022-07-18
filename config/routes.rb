Rails.application.routes.draw do
  get '/users/show:id', to: 'users#show', as: 'user'

  resources :posts
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
