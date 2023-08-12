Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contacts

  get '/search-address/:cep', to: 'adresses#search_address'
end
