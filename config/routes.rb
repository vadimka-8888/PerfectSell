Rails.application.routes.draw do
  root 'start#index'

  get '/account/show_acc', to: 'account#show_acc'
  get '/account/show_cons', to: 'account#show_cons'
  resources :stores
  resources :offers do
    resources :bargains, only: [:new, :create, :destroy,:edit]
  end
  resources :account
  resources :proposers
  resource :session, only: [:new, :create, :destroy]


end
