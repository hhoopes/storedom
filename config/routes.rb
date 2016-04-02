Rails.application.routes.draw do
  root 'stores#index'

  get '/stores', to: "stores#index"

  resources :items,  only: [:index]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  scope ":store_name" do
    get '/', to: "stores#show" # /:store_name/items/id/edit
    resources :items, only: [:edit, :show, :index], module: :stores # /:store_name/items/id/edit
    patch '/items/:id', to: "stores/items#update", as: :update_item
  end
# may use :path to get at same idea as scoping
# :as gives the helper
end
