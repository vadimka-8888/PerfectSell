Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'start#index'

  get '/mainpage', to: 'mainpage#mainpage'
  get '/goods', to: 'goods#goods'
  get '/test', to: 'test#test'
  post '/test2', to: 'test#test2'
end
