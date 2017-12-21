Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"
  namespace :api, defaults: { format: :json } do
    resources :categories, only: [:create, :destroy, :show, :index]
    resources :customers, only: [:create, :destroy, :show, :index]
    resources :products, only: [:create, :destroy, :show, :index]
    resources :orders, only: [:create, :destroy, :show, :index]
    resources :product_orders, only: [:create, :destroy, :show, :index]
    resources :categories_join_tables, only: [:create, :destroy, :show, :index]
  end
end
