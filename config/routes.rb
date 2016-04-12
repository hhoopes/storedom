Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :users
  resources :orders, only: [:index, :show]

  namespace :api, defaults: {format: :json} do # set default up here and all will inherit
    namespace :v1 do
      resources :items, except: [:new, :edit]
    end
  end
end
