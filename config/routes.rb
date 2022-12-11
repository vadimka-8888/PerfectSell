Rails.application.routes.draw do
  root 'start#index'

  get '/mainpage', to: 'mainpage#mainpage'
  get '/goods', to: 'goods#goods'
  get '/test', to: 'test#test'
end
