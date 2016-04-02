Rails.application.routes.draw do
  root 'items#index'

  get '/stores', to: "stores#index"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  
  scope ":store_name" do
    get '/', to: "stores#show" # /:store_name/items/id/edit
    resources :items, only: [:edit, :update], module: :stores # /:store_name/items/id/edit
  end
# may use :path to get at same idea as scoping
# :as gives the helper
end
