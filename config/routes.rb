Rails.application.routes.draw do
  root 'stores#index'

  get "/dashboard", to: "users#show"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :users, only: [:new, :create]

  namespace :platform_admin do
    resources :stores, only: [:index, :update]
    get "/dashboard", to: "users#show"
  end

  namespace :store_admin do
    resources :orders, only: [:index, :show, :update]
    resources :users,  only: [:index, :show]
    resources :items, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/stores', to: "stores#index"

  resources :items,  only: [:index]


  scope ":store_name" do
    get '/', to: "stores#show" # /:store_name/items/id/edit
    resources :items, only: [:show, :index, :edit], module: :stores # /:store_name/items/id/edit
    patch '/items/:id', to: "stores/items#update"
  end
# may use :path to get at same idea as scoping
# :as gives the helper
end
