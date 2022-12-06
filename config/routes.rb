Rails.application.routes.draw do
  root 'start#index'

  get '/shops', to: 'shops#mainpage'
  get '/goods', to: 'goods#goods'
  get '/page_shop', to: 'page_shop#page_shop'
  resources :shops

end
