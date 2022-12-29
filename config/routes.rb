Rails.application.routes.draw do
  root 'start#index'

  get '/goods', to: 'goods#goods'
  get '/page_shop', to: 'page_shop#page_shop'
  get '/account/show_acc', to: 'account#show_acc'
  get '/account/show_cons', to: 'account#show_cons'
  resources :goods
  resources :stores
  resources :offers do
    resources :bargains, only: [:new, :create, :destroy]
  end
  resources :account
  resources :proposers
  resource :session, only: %i[new create destroy]


end
