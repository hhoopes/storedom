Rails.application.routes.draw do
  root 'items#index'

  resources :items
  resources :users
  resources :orders, only: [:index, :show]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items

    end
  end
end
