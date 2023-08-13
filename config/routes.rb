Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :contacts

  get '/search-address/:cep', to: 'addresses#search_address'
  get '/search-text/:address', to: 'addresses#search_text'
end
